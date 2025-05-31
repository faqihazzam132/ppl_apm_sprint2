const phrases = [
  {
    before: "The Best ",
    highlight: "Food Supplier",
    after: " on Earth"
  },
  {
    before: "The Best ",
    highlight: "Meat Supplier",
    after: " on Earth"
  },
  {
    before: "The Best ",
    highlight: "Seafood Supplier",
    after: " on Earth"
  },
  {
    before: "The Best ",
    highlight: "Poultry Supplier",
    after: " on Earth"
  }
];

const el = document.getElementById("typewriter");

let phraseIndex = 0;
let charIndex = 0;
let part = 'before'; // bagian mana yg sedang diketik
let isDeleting = false;

function typeLoop() {
  const current = phrases[phraseIndex];
  let display = "";

  if (!isDeleting) {
    if (part === 'before') {
      charIndex++;
      display = current.before.substring(0, charIndex);
      if (charIndex === current.before.length) {
        part = 'highlight';
        charIndex = 0;
      }
    } else if (part === 'highlight') {
      charIndex++;
      display = current.before + `<span class="text-red-600 font-semibold">` + current.highlight.substring(0, charIndex) + `</span>`;
      if (charIndex === current.highlight.length) {
        part = 'after';
        charIndex = 0;
      }
    } else if (part === 'after') {
      charIndex++;
      display = current.before + `<span class="text-red-600 font-semibold">` + current.highlight + `</span>` + current.after.substring(0, charIndex);
      el.innerHTML = display;

      if (charIndex === current.after.length) {
        isDeleting = true;
        setTimeout(typeLoop, 2000); // jeda sebelum mulai menghapus
        return;
      }
    }
  } else {
    if (part === 'after') {
      charIndex--;
      display = current.before + `<span class="text-red-600 font-semibold">` + current.highlight + `</span>` + current.after.substring(0, charIndex);
      if (charIndex === 0) {
        part = 'highlight';
        charIndex = current.highlight.length;
      }
    } else if (part === 'highlight') {
      charIndex--;
      display = current.before + `<span class="text-red-600 font-semibold">` + current.highlight.substring(0, charIndex) + `</span>`;
      if (charIndex === 0) {
        part = 'before';
        charIndex = current.before.length;
      }
    } else if (part === 'before') {
      charIndex--;
      display = current.before.substring(0, charIndex);
      if (charIndex === 0) {
        isDeleting = false;
        phraseIndex = (phraseIndex + 1) % phrases.length;
        part = 'before';
        charIndex = 0;
      }
    }
  }

  el.innerHTML = display;

  const typingSpeed = isDeleting ? 50 : 120;
  setTimeout(typeLoop, typingSpeed);
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", () => {
    if(el) {
      typeLoop();
    } else {
      console.error("Typewriter element not found");
    }
  });
} else {
  if(el) {
    typeLoop();
  } else {
    console.error("Typewriter element not found");
  }
}

let currentIndex = 0;
const carousel = document.getElementById('carousel');
const slidesToShow = 4;
const totalSlides = carousel ? carousel.children.length : 0;

function updateCarousel() {
  const offset = -(100 / slidesToShow) * currentIndex;
  if (carousel) {
    carousel.style.transform = `translateX(${offset}%)`;
  }
}

function nextSlide() {
  if (currentIndex < totalSlides - slidesToShow) {
    currentIndex++;
  } else {
    currentIndex = 0;
  }
  updateCarousel();
}

function prevSlide() {
  if (currentIndex > 0) {
    currentIndex--;
  } else {
    currentIndex = totalSlides - slidesToShow;
  }
  updateCarousel();
}

function openWhatsApp() {
  console.log("openWhatsApp called");
  const phone = "628123456789"; // Ganti dengan nomor WA kamu
  const message = "Halo! Saya tertarik dan ingin berdiskusi.";
  const url = `https://wa.me/${phone}?text=${encodeURIComponent(message)}`;
  window.open(url, "_blank");
}

function closeBubble() {
  console.log("closeBubble called");
  const bubble = document.getElementById("whatsappBubble");
  if (bubble) {
    bubble.style.display = "none";
  }
}
