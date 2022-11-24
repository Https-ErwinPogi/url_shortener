import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["link"]

    copy() {
        navigator.clipboard.writeText(this.linkTarget.textContent);
        document.getElementsByClassName("notice")[0].innerText = 'Copy Link: ' + this.linkTarget.textContent
    }
}