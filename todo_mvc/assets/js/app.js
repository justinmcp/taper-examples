import { Socket } from "phoenix";
import React from "react";
import ReactDOM from "react-dom";
import { Taper } from "taper";
import App from "./components/App";
import css from "../css/app.scss";

let taperToken = document
  .querySelector("meta[name='taper-token']")
  .getAttribute("content");
let rootComponent = document.getElementById("taper");
window.taper = new Taper(
  "/taper",
  { Socket, React, ReactDOM },
  { params: { taperToken } }
);
window.taper.connect();
window.taper.render(<App />, rootComponent);
