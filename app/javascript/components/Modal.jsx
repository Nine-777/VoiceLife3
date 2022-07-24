import React from "react";

const Modal = () => {
  return (
    <>
      <div id="overlay">
        <div id="modalContent">
          <p>This is ModalContent</p>
          <button>Close</button>
        </div>
      </div>
    </>
  );
};

export default Modal;