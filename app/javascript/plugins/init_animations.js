import AOS from 'aos';
import 'aos/dist/aos.css';

export const initAnimations = () => {
  AOS.init({
    startEvent: 'turbolinks:load' // if you are using turbolinks
  })
}