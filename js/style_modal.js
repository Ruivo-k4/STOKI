export function styleModal(mdl) {
    mdl.style.display = "flex";
    mdl.style.flexDirection = 'column';

    mdl.style.top = '50%';
    mdl.style.left = '50%';
    mdl.style.transform = 'translate(-50%, -50%)';

    mdl.style.padding = "2rem";

    mdl.style.width = "40dvw";
    mdl.style.height = "85dvh";
}