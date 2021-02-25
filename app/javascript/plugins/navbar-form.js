export const initDynamicSearchbar = () => {
  const form = document.querySelector('.search-form')
  if (document.body.dataset.page === 'pages_home') {
    window.addEventListener('scroll', () => {
      if (window.scrollY === 0) {
        form.classList.remove('sticky')
      } else {
        form.classList.add('sticky')
      }
    })
  } else {
    form.classList.add('sticky')
  }
}
