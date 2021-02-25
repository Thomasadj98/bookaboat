export const initHomeSearchbar = () => {
  if (document.body.dataset.page === 'pages_home') {
    const form = document.querySelector('.search-form')
    window.addEventListener('DOMContentLoaded', () => {
      form.classList.remove('sticky')
    })
  }
}

export const initDynamicSearchbar = () => {
  if (document.body.dataset.page === 'pages_home') {
    const form = document.querySelector('.search-form')
    window.addEventListener('scroll', () => {
      if (window.scrollY === 0) {
        form.classList.remove('sticky')
      } else {
        form.classList.add('sticky')
      }
    })
  }
}
