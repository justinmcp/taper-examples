import { connect } from "taper";
import Header from "../components/Header";
import { addTodo } from "../actions";

export default connect(null, { addTodo })(Header);
