export function styleModal(mdl) {
    mdl.style.display = "flex";
    mdl.style.flexDirection = 'column';

    mdl.style.top = '50%';
    mdl.style.left = '50%';
    mdl.style.transform = 'translate(-50%, -50%)'; 

    mdl.style.width = "80dvw";
    mdl.style.height = "80dvh";
}