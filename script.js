// ===== Splash Screen =====
window.addEventListener('load', function() {
  setTimeout(function() {
    var splash = document.getElementById('splash');
    if (splash) {
      splash.classList.add('hidden');
    }
  }, 1800);
});

// ===== Navigation =====
var navToggle = document.getElementById('navToggle');
var navLinks = document.getElementById('navLinks');

if (navToggle) {
  navToggle.addEventListener('click', function() {
    navLinks.classList.toggle('open');
    navToggle.classList.toggle('active');
  });
}

if (navLinks) {
  navLinks.addEventListener('click', function(e) {
    if (e.target.tagName === 'A') {
      navLinks.classList.remove('open');
      if (navToggle) navToggle.classList.remove('active');
    }
  });
}

// Navigation scroll effects
var mainNav = document.getElementById('mainNav');

window.addEventListener('scroll', function() {
  if (mainNav) {
    mainNav.classList.toggle('scrolled', window.scrollY > 10);
  }
});

// Active link highlighting
var sections = document.querySelectorAll('section[id], header[id]');
var navAnchors = document.querySelectorAll('.nav-links a');

function updateActiveLink() {
  var scrollY = window.scrollY + 120;
  var currentId = '';

  sections.forEach(function(section) {
    if (section.offsetTop <= scrollY) {
      currentId = section.id;
    }
  });

  navAnchors.forEach(function(a) {
    a.classList.toggle('active', a.getAttribute('href') === '#' + currentId);
  });
}

window.addEventListener('scroll', updateActiveLink);
updateActiveLink();

// Progress bar on nav
function updateProgress() {
  var scrollTop = window.scrollY;
  var docHeight = document.documentElement.scrollHeight - window.innerHeight;
  var progress = docHeight > 0 ? (scrollTop / docHeight) * 100 : 0;
  if (mainNav) {
    mainNav.style.borderImage =
      'linear-gradient(to right, #1a6b8a ' + progress + '%, transparent ' + progress + '%) 1';
  }
}

window.addEventListener('scroll', updateProgress);

// ===== Hero Stats Counter =====
function animateCounters() {
  var counters = document.querySelectorAll('.stat-num');
  counters.forEach(function(counter) {
    var target = parseInt(counter.getAttribute('data-target'));
    var current = 0;
    var step = target / 50;
    var timer = setInterval(function() {
      current += step;
      if (current >= target) {
        counter.textContent = target;
        clearInterval(timer);
      } else {
        counter.textContent = Math.floor(current);
      }
    }, 30);
  });
}

// Trigger counters when hero stats are visible
var statsObserver = new IntersectionObserver(function(entries) {
  entries.forEach(function(entry) {
    if (entry.isIntersecting) {
      animateCounters();
      statsObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.5 });

var heroStats = document.querySelector('.hero-stats');
if (heroStats) {
  statsObserver.observe(heroStats);
}

// ===== Scroll Hint Hide =====
var scrollHint = document.getElementById('scrollHint');
window.addEventListener('scroll', function() {
  if (scrollHint && window.scrollY > 100) {
    scrollHint.style.opacity = '0';
  }
});

// ===== Location Info Panel =====
var locationData = {
  padstow: {
    title: 'Padstow',
    description: 'The crown jewel of North Cornwall. A gorgeous working fishing harbour that\'s become a world-class foodie destination. Home to Rick Stein\'s empire, Paul Ainsworth\'s restaurants, the Chough Bakery, the National Lobster Hatchery, and the start of the Camel Trail. Wander the narrow streets, watch the fishing boats come and go, take the ferry to Rock, or just sit on the harbour wall with fish and chips. Pure magic.',
    highlights: ['Rick Stein\'s', 'Harbour', 'Camel Trail', 'Ferry to Rock', 'Chough Bakery', 'Lobster Hatchery']
  },
  polzeath: {
    title: 'Polzeath',
    description: 'The surfing capital of North Cornwall and the Borton family\'s spiritual beach home. A massive, golden sandy beach with reliable surf, brilliant surf schools, and a laid-back vibe that epitomises Cornish summer. The beach cafes, the Tubestation, and the Oyster Catcher pub make it a complete destination. New Polzeath sits just up the hill with more shops and the Spar for supplies.',
    highlights: ['Surfing', 'Surf Schools', 'Tubestation', 'Oyster Catcher', 'Family Beach', 'Coast Path']
  },
  rock: {
    title: 'Rock',
    description: 'Affectionately known as "Chelsea-on-Sea", Rock sits across the Camel Estuary from Padstow. It\'s the water sports hub of the area \u2014 sailing, water-skiing, kayaking, and paddleboarding are all big here. Nathan Outlaw\'s Mariners pub does incredible food. Catch the Black Tor ferry across to Padstow, or walk along to Daymer Bay and St Enodoc Church.',
    highlights: ['Water Sports', 'The Mariners', 'Ferry to Padstow', 'Sailing', 'Shops', 'Daymer Bay walk']
  },
  harlyn: {
    title: 'Harlyn Bay',
    description: 'The Borton family\'s go-to beach when the wind is up. Sheltered from south-westerly winds, Harlyn always delivers. Beautiful golden sand, excellent rock pools at low tide, a proper beach shop, and the Harlyn Inn just up the road. It\'s also the closest beach to Mother Ivey\'s \u2014 just a 5-minute drive or a lovely 15-minute clifftop walk.',
    highlights: ['Sheltered', 'Rock Pools', 'Close to Mother Ivey\'s', 'Harlyn Inn', 'Family-Friendly', 'Surf School']
  },
  constantine: {
    title: 'Constantine Bay',
    description: 'A dramatic, expansive beach backed by the Trevose Golf Club. Constantine gets great surf and has a wilder, more unspoilt feel than Polzeath. The National Trust car park is worth the membership. Walk south along the coast path to Treyarnon Bay, or north to Booby\'s Bay and Trevose Head. The views are extraordinary.',
    highlights: ['Great Surf', 'National Trust', 'Dramatic Scenery', 'Coast Path', 'Golf Course', 'Booby\'s Bay']
  },
  motheriveys: {
    title: 'Mother Ivey\'s Bay Holiday Park',
    description: 'Home! The Borton family base camp. Perched spectacularly on the clifftops between Harlyn Bay and Trevose Head. The park has its own private beach cove accessed by steps down the cliff. The sunsets from the clifftop are out of this world. Perfectly positioned for accessing all the best beaches, walks, and Padstow itself.',
    highlights: ['Clifftop Location', 'Private Beach', 'Stunning Sunsets', 'Coast Path', 'Family Run', 'Central Location']
  },
  trevose: {
    title: 'Trevose Head',
    description: 'The dramatic headland that juts out between Harlyn Bay and Constantine Bay. Home to the Trevose Head Lighthouse (built 1847) and an RNLI lifeboat station. The coast path walk around the headland is spectacular \u2014 seal colonies on the rocks below, seabirds wheeling overhead, and views that stretch to Tintagel on a clear day.',
    highlights: ['Lighthouse', 'RNLI Station', 'Seal Colonies', 'Coast Path', 'Panoramic Views', 'Seabirds']
  },
  trebetherick: {
    title: 'Trebetherick',
    description: 'A quiet, residential village between Polzeath and Rock. Most famous as the home of poet John Betjeman, who loved this area so much he\'s buried at the tiny St Enodoc Church in the dunes nearby. Daymer Bay beach is just below \u2014 calm, shallow, and perfect for families with young children. The village has a small shop and a lovely relaxed feel.',
    highlights: ['John Betjeman', 'St Enodoc Church', 'Daymer Bay', 'Quiet Village', 'Family-Friendly', 'Dune Walks']
  }
};

function showLocationInfo(location) {
  var panel = document.getElementById('locationInfoPanel');
  var content = document.getElementById('panelContent');
  var data = locationData[location];

  if (!data || !panel || !content) return;

  var highlightsHtml = data.highlights.map(function(h) {
    return '<span>' + h + '</span>';
  }).join('');

  content.innerHTML =
    '<h3>' + data.title + '</h3>' +
    '<p>' + data.description + '</p>' +
    '<div class="panel-highlights">' + highlightsHtml + '</div>';

  panel.classList.add('active');

  // Highlight active pin
  document.querySelectorAll('.location-pin').forEach(function(pin) {
    pin.classList.toggle('active', pin.getAttribute('data-location') === location);
  });
}

function closeLocationInfo() {
  var panel = document.getElementById('locationInfoPanel');
  if (panel) panel.classList.remove('active');
  document.querySelectorAll('.location-pin').forEach(function(pin) {
    pin.classList.remove('active');
  });
}

// Close panel on escape key
document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') closeLocationInfo();
});

// ===== Beach Filters =====
var beachFilters = document.getElementById('beachFilters');
if (beachFilters) {
  beachFilters.addEventListener('click', function(e) {
    if (!e.target.classList.contains('filter-tab')) return;

    // Update active tab
    beachFilters.querySelectorAll('.filter-tab').forEach(function(tab) {
      tab.classList.remove('active');
    });
    e.target.classList.add('active');

    var filter = e.target.getAttribute('data-filter');
    var cards = document.querySelectorAll('.beach-card');

    cards.forEach(function(card) {
      if (filter === 'all') {
        card.classList.remove('hidden');
      } else {
        var tags = card.getAttribute('data-tags');
        if (tags && tags.indexOf(filter) !== -1) {
          card.classList.remove('hidden');
        } else {
          card.classList.add('hidden');
        }
      }
    });
  });
}

// ===== Walk Filters =====
var walkFilters = document.getElementById('walkFilters');
if (walkFilters) {
  walkFilters.addEventListener('click', function(e) {
    if (!e.target.classList.contains('filter-tab')) return;

    walkFilters.querySelectorAll('.filter-tab').forEach(function(tab) {
      tab.classList.remove('active');
    });
    e.target.classList.add('active');

    var filter = e.target.getAttribute('data-filter');
    var items = document.querySelectorAll('.walk-item');

    items.forEach(function(item) {
      if (filter === 'all') {
        item.classList.remove('hidden');
      } else {
        var difficulty = item.getAttribute('data-difficulty');
        if (difficulty === filter) {
          item.classList.remove('hidden');
        } else {
          item.classList.add('hidden');
        }
      }
    });
  });
}

// ===== Dining Filters =====
var diningFilters = document.getElementById('diningFilters');
if (diningFilters) {
  diningFilters.addEventListener('click', function(e) {
    if (!e.target.classList.contains('filter-tab')) return;

    diningFilters.querySelectorAll('.filter-tab').forEach(function(tab) {
      tab.classList.remove('active');
    });
    e.target.classList.add('active');

    var filter = e.target.getAttribute('data-filter');
    var cards = document.querySelectorAll('.dining-card');

    cards.forEach(function(card) {
      if (filter === 'all') {
        card.classList.remove('hidden');
      } else {
        var tags = card.getAttribute('data-tags');
        if (tags && tags.indexOf(filter) !== -1) {
          card.classList.remove('hidden');
        } else {
          card.classList.add('hidden');
        }
      }
    });
  });
}

// ===== Adventure Card Flip =====
function toggleAdventure(card) {
  card.classList.toggle('flipped');
}

// ===== Packing Checklist with LocalStorage =====
var checklist = document.getElementById('packingChecklist');
if (checklist) {
  // Load saved state
  var checkboxes = checklist.querySelectorAll('input[type="checkbox"]');
  checkboxes.forEach(function(cb) {
    var item = cb.getAttribute('data-item');
    var saved = localStorage.getItem('borton_pack_' + item);
    if (saved === 'true') {
      cb.checked = true;
      cb.closest('.check-item').classList.add('checked');
    }

    cb.addEventListener('change', function() {
      localStorage.setItem('borton_pack_' + item, cb.checked);
      cb.closest('.check-item').classList.toggle('checked', cb.checked);
    });
  });
}

// ===== Weather Widget =====
function toggleWeather() {
  var panel = document.getElementById('weatherPanel');
  if (panel) panel.classList.toggle('active');
}

// Close weather on outside click
document.addEventListener('click', function(e) {
  var widget = document.getElementById('weatherWidget');
  var panel = document.getElementById('weatherPanel');
  if (widget && panel && !widget.contains(e.target)) {
    panel.classList.remove('active');
  }
});

// ===== Back to Top =====
var backToTop = document.getElementById('backToTop');
window.addEventListener('scroll', function() {
  if (backToTop) {
    backToTop.classList.toggle('visible', window.scrollY > 400);
  }
});

function scrollToTop() {
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

// ===== Scroll Animations =====
var animateElements = document.querySelectorAll(
  '.beach-card, .walk-item, .dining-card, .venue-card, .feature-card, .tip-card, .highlight-item, .adventure-card'
);

var scrollObserver = new IntersectionObserver(function(entries) {
  entries.forEach(function(entry) {
    if (entry.isIntersecting) {
      entry.target.style.opacity = '1';
      entry.target.style.transform = 'translateY(0)';
      scrollObserver.unobserve(entry.target);
    }
  });
}, {
  threshold: 0.1,
  rootMargin: '0px 0px -50px 0px'
});

animateElements.forEach(function(el, index) {
  el.style.opacity = '0';
  el.style.transform = 'translateY(20px)';
  el.style.transition = 'opacity 0.5s ease ' + (index % 4) * 0.1 + 's, transform 0.5s ease ' + (index % 4) * 0.1 + 's';
  scrollObserver.observe(el);
});

// ===== Parallax on Hero =====
var heroParallax = document.getElementById('heroParallax');
window.addEventListener('scroll', function() {
  if (heroParallax && window.scrollY < window.innerHeight) {
    heroParallax.style.transform = 'translateY(' + (window.scrollY * 0.3) + 'px)';
  }
});
