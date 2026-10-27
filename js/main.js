console.log("Main.js is on");

import './header.js';
import './menu.js';
import './content.js';
import './modal.js';
import './cadIndex.js';
import './buttonsConfig.js';

export function user_state_capture() {
    let capture_id_in = document.querySelector("#capture-id__in");
    let user_state = capture_id_in.value;

    return user_state;
}