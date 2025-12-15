// load danh sách quê quán
async function loadHometowns() {
  const res = await fetch("/api/hometowns");
  const data = await res.json();
  if (data == null || data?.status == "99") {
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: data?.messsage || "Có lỗi xãy ra, vui lòng kiểm tra lại!",
    });
    return;
  }
  hometowns = data.data;

  const select = document.getElementById("hometown");
  select.innerHTML = `<option value="">-- Chọn quê quán --</option>`;
  hometowns.forEach((h) => {
    const opt = document.createElement("option");
    opt.value = h.code;
    opt.textContent = h.name;
    select.appendChild(opt);
  });
}

// load danh sách công nhân
async function loadWorkers() {
  const res = await fetch("/api/workers");
  const data = await res.json();
  console.log(data);

  if (data == null || data?.status == "99") {
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: data?.message || "Có lỗi xãy ra, vui lòng kiểm tra lại!",
    });
    return;
  }
  const tbody = document.querySelector("#workerTable tbody");
  tbody.innerHTML = "";
  workers = data.data;
  workers.forEach((w) => {
    const row = document.createElement("tr");
    row.innerHTML = `
      <td>${w.name}</td>
      <td>${w.birthYear}</td>
      <td>${w.hometownName}</td>
      <td>${formatCurrency(w.salary)}</td>
    `;
    tbody.appendChild(row);
  });
}

const formatCurrency = (value) => {
  return new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
  }).format(value);
};

// thêm công nhân mới
document.getElementById("workerForm").addEventListener("submit", async (e) => {
  e.preventDefault();

  const worker = {
    name: document.getElementById("name").value,
    birthYear: parseInt(document.getElementById("birthYear").value),
    hometownId: document.getElementById("hometown").value,
    salary: parseFloat(document.getElementById("salary").value),
  };

  const res = await fetch("/api/workers/create", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(worker),
  });
  const data = await res.json();

  if (data == null || data?.status == "99") {
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: "Có lỗi xãy ra, vui lòng kiểm tra lại!",
    });
    return;
  }

  Swal.fire({
    title: "Thêm mới thông tin thành công!",
    icon: "success",
    draggable: true,
  });

  e.target.reset();
  loadWorkers();
});

async function initPage() {
  await loadHometowns();
  await loadWorkers();
}

initPage();
