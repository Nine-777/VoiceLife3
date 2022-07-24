import React, { useState } from "react";
import Modal from "./components/Modal"; //Modalコンポーネントをimportする

const App = () => {
  const [showModal, setShowModal] = useState(false); // Modalコンポーネントの表示の状態を定義する

  return (
    <>
      <h2>Modal実装</h2>
      <button>Open Modal</button>
      {/* Appコンポーネントから子であるModalコンポーネントにpropsを渡す */}
      <Modal showFlag={showModal} />
    </>
  );
};

export default App;