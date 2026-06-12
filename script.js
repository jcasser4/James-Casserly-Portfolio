
const navToggle = document.querySelector('[data-nav-toggle]');
const nav = document.querySelector('[data-nav]');
if (navToggle && nav) {
  navToggle.addEventListener('click', () => {
    const open = nav.classList.toggle('is-open');
    document.body.classList.toggle('nav-open', open);
    navToggle.setAttribute('aria-expanded', String(open));
  });
  nav.querySelectorAll('a').forEach((link) => link.addEventListener('click', () => {
    nav.classList.remove('is-open');
    document.body.classList.remove('nav-open');
    navToggle.setAttribute('aria-expanded', 'false');
  }));
}

const filters = document.querySelectorAll('[data-filter]');
const projectCards = document.querySelectorAll('[data-project-grid] .project-card');
filters.forEach((button) => {
  button.addEventListener('click', () => {
    const filter = button.dataset.filter;
    filters.forEach((btn) => btn.classList.toggle('active', btn === button));
    projectCards.forEach((card) => {
      const match = filter === 'All' || card.dataset.category === filter;
      card.classList.toggle('is-hidden', !match);
    });
  });
});
