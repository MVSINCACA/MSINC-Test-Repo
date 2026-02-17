// ===== Navigation: mobile toggle =====
const navToggle = document.getElementById("navToggle");
const navLinks = document.getElementById("navLinks");

navToggle.addEventListener("click", () => {
  navLinks.classList.toggle("open");
});

// Close mobile menu when a link is clicked
navLinks.addEventListener("click", (e) => {
  if (e.target.tagName === "A") {
    navLinks.classList.remove("open");
  }
});

// ===== Navigation: scroll shadow =====
const topNav = document.getElementById("topNav");

window.addEventListener("scroll", () => {
  topNav.classList.toggle("scrolled", window.scrollY > 10);
});

// ===== Navigation: active link highlighting =====
const sections = document.querySelectorAll("section[id], header[id]");
const navAnchors = document.querySelectorAll(".nav-links a");

function updateActiveLink() {
  const scrollY = window.scrollY + 120;

  let currentId = "";
  sections.forEach((section) => {
    if (section.offsetTop <= scrollY) {
      currentId = section.id;
    }
  });

  navAnchors.forEach((a) => {
    a.classList.toggle("active", a.getAttribute("href") === "#" + currentId);
  });
}

window.addEventListener("scroll", updateActiveLink);
updateActiveLink();

// ===== Back to top button =====
const backToTop = document.getElementById("backToTop");

window.addEventListener("scroll", () => {
  backToTop.classList.toggle("visible", window.scrollY > 400);
});

backToTop.addEventListener("click", () => {
  window.scrollTo({ top: 0, behavior: "smooth" });
});

// ===== Collapsible lessons (toggle body visibility) =====
document.querySelectorAll(".lesson-header").forEach((header) => {
  header.addEventListener("click", () => {
    const body = header.nextElementSibling;
    const isHidden = body.style.display === "none";
    body.style.display = isHidden ? "block" : "none";
    header.setAttribute("aria-expanded", isHidden);
  });
});

// ===== Smooth progress indicator on scroll =====
function updateProgress() {
  const scrollTop = window.scrollY;
  const docHeight = document.documentElement.scrollHeight - window.innerHeight;
  const progress = docHeight > 0 ? (scrollTop / docHeight) * 100 : 0;

  // Update the nav border to act as a progress bar
  topNav.style.borderImage =
    "linear-gradient(to right, #2563eb " +
    progress +
    "%, #e2e8f0 " +
    progress +
    "%) 1";
}

window.addEventListener("scroll", updateProgress);
updateProgress();
