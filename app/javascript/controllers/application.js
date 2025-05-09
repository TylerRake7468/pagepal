import { Application } from "@hotwired/stimulus"
import "rails-ujs"; // Ensure this line is present
import "@hotwired/turbo-rails"
import 'flowbite'
const application = Application.start();
application.debug = false;
window.Stimulus = application;
export { application }