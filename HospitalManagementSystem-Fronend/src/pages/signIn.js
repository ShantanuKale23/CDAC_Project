import DropdownItem from "@restart/ui/esm/DropdownItem";
import { useNavigate } from "react-router";
import { useEffect, useState } from "react";
import { toast } from "react-toastify";
import {
  Container,
  Form,
  Button,
  Row,
  Col,
  Dropdown,
  DropdownButton,
  SplitButton,
  ButtonGroup,
  Image,
} from "react-bootstrap";
import "../components/full.css";
import { Link } from "react-router-dom";


import img12 from "../assets/logo.png";
import { getUser } from "../data";
import axios from "axios";
import { URL } from "../config";
import "./signIn.css";
import img1 from "../assets/header.jpg";

import ReCAPTCHA from "react-google-recaptcha"

//--------------------------- To reception.js------------
 import WardDropdownElement from "../components/patient/wardDropdownElement";
 import WardTableSignIn from "../components/signin/wardTable";
//--------------------------- To reception.js------------

const SignIn = () => {
  const [role, setRole] = useState("Select Role");
  const [email, setEmail] = useState("enter your emai");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  
  //wards relatedconst [wardId, setWardId] = useState(0);
  
  //--------------------------- To reception.js------------
  const [wards, setWards] = useState([]);
  //--------------------------- To reception.js------------
  
    let user;
  

  /*To get wards from server*/

//--------------------------- To reception.js------------
    const GetWardsFromServer = () => {
      const url = `${URL}/ward/getAllWards`;
      axios.get(url).then((res) => {
       const result = res.data;
       console.log(result);
       if (result.status == "success") setWards(result.data);
     }).catch(err=>{
       navigate("/error");
  });
    };
//--------------------------- To reception.js------------


  // --------------------------------------------------------------------------
  const getUserFromServer = () => {
    console.log("email" + email + "   password" + password + "  role :" + role);
    const body = {
      email,
      password,
      role,
    };

    const url = `${URL}/user/authenticate`;
    axios.post(url, body).then((req) => {
      console.log(req);
      let result = req.data;

      if (
        result.data != "invalid_user" &&
        result.data != "invalid_password" &&
        result.status == "success"
      ) {
        
        user = result.data;
        sessionStorage.setItem(`token_${user.role}`, result.data.token);
        const token = sessionStorage.getItem("token_admin");

        if (role == user.role) {
          if (role == "patient") {
            toast.success("logged in success", {
              position: toast.POSITION.TOP_CENTER,
            });
            navigate("/patientDetails", { state: { patId: user.patId } });
          }
          if (role == "admin") {
            console.log("in admin");
            toast.success("logged in success", {
              position: toast.POSITION.TOP_CENTER,
            });
            navigate("/admin");
          }
          if (role == "reception") {
            toast.success("logged in success", {
              position: toast.POSITION.TOP_CENTER,
            });
            navigate("/reception", { state: { patId: user.patId } });
          }
          if (role == "doctor") {
            toast.success("logged in success", {
              position: toast.POSITION.TOP_CENTER,
            });
            navigate("/doctor", { state: { doctorId: user.doctorId } });
          }
          //for signin if it is accountant
          if (role == "accountant") {
            toast.success("logged in success", {
              position: toast.POSITION.TOP_CENTER,
            });
            navigate("/accountant");
          }
        } else {
          navigate("/");
          toast.warning("invalid role selected", {
            position: toast.POSITION.TOP_CENTER,
          });
        }
      } else {
        if (result.data == "invalid_password") {
          navigate("/");
          toast.warning("invalid password", {
            position: toast.POSITION.TOP_CENTER,
          });
        } else {
          navigate("/");
          toast.warning("invalid email", {
            position: toast.POSITION.TOP_CENTER,
          });
        }
      }
    }).catch(err=>{
      navigate("/error");
  });
  };

 //--------------------------- To reception.js------------
   useEffect(() => {
     GetWardsFromServer();
   }, []);
 //--------------------------- To reception.js------------
const [varified,setVarified] =useState(false)
function onChange(value) {
  console.log("Captcha value:", value);
  setVarified(true);
}
  return (
    <Container fluid style={{ height: "100%", width: "100%" }}>
       <Container
        //  style={{
        //   backgroundColor: 'green'
        // }}
        style={{backgroundImage: `url(${img1}`}}
        >
        <Row>
          <Col>
          <img src={img12} className="logo"></img>
          </Col>
          <Col>
        <div class="heading">
         {/* <img src={img12} className="logo"></img>  */}
          <h1>Hospital Management System</h1>
          <br></br>
        </div>
        </Col>
        </Row>
      </Container> 
       
       <Container
        fluid
        className="d-flex justify-content-center corosoleContainer"
      >
        <Row >
          <table 
            className="table table-hover "
            style={{ margin: "5px", border: "solid", width: "500px" }}
          >
            <thead style={{ backgroundColor: "gray" }}>
              <tr>
                <th>Wards</th>
                <th>Available Beds</th>
                <th>Total Beds</th>
              </tr>
            </thead>
            <tbody className="tableBody" style={{ backgroundColor: "bisque" }}>
              {wards.map((ward) => {
                return <WardTableSignIn ward={ward} />;
              })}
            </tbody>
          </table>
          </Row>
      </Container> 
      
      <Row>
        <Col>
          <Container
            fluid
            className="d-flex justify-content-center signInContainer"
          >
            <Row>
              <Col>
                {/* drop down role*/}
                <div style={{ marginTop: "10px" }}>
                  <DropdownButton size="sm" title={role} variant="warning">
                    <Dropdown.Item as="Button">
                      <div
                        id="setAdmin"
                        onClick={(e) => {
                          setRole(e.target.innerText);
                        }}
                      >
                        admin
                      </div>
                    </Dropdown.Item>
                    <Dropdown.Item>
                      <div
                        id=""
                        onClick={(e) => {
                          setRole(e.target.innerText);
                        }}
                      >
                        accountant
                      </div>
                    </Dropdown.Item>
                    <Dropdown.Item>
                      <div
                        onClick={(e) => {
                          setRole(e.target.innerText);
                        }}
                      >
                        reception
                      </div>
                    </Dropdown.Item>
                    <Dropdown.Item>
                      <div
                        onClick={(e) => {
                          setRole(e.target.innerText);
                        }}
                      >
                        patient
                      </div>
                    </Dropdown.Item>
                    <Dropdown.Item>
                      <div
                        onClick={(e) => {
                          setRole(e.target.innerText);
                        }}
                      >
                        doctor
                      </div>
                    </Dropdown.Item>
                  </DropdownButton>
                </div>

                <Form.Group className="mb-3" controlId="formBasicEmail">
                  <Form.Label>
                    <div style={{ fontWeight: "bold", color: "" }}>
                      Email address
                    </div>{" "}
                  </Form.Label>
                  <Form.Control
                    onChange={(e) => {
                      setEmail(e.target.value);
                    }}
                    type="email"
                    placeholder="Enter email"
                  />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                  <Form.Label>
                    <div style={{ fontWeight: "bold", color: "" }}>
                      Password
                    </div>
                  </Form.Label>
                  <Form.Control
                    onChange={(e) => {
                      setPassword(e.target.value);
                    }}
                    type="password"
                    placeholder="Password"
                  />
                </Form.Group>
                
                  <Form.Group>
                  <ReCAPTCHA
                      sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"
                      onChange={onChange}
                  />
                </Form.Group>

                <div
                  style={{ marginTop: "20px", fontSize: "20px" }}
                  className="position-relative"
                >
                  <div style={{ marginTop: "10px" }}>
                    <Button
                      variant="success"
                      size="sm"
                      type="submit"
                      disabled={!varified}
                      onClick={() => {
                        getUserFromServer();
                      }}
                    >
                      <div style={{ fontSize: "20px" }}>Login</div>
                    </Button>
                  </div>
                  <div style={{ marginTop: "0px" }}>
                    <Link to="/resetPassword">
                      <div style={{ fontSize: "25px", color: "black" }}>
                        forgot password
                      </div>
                    </Link>
                  </div>
                </div>
              </Col>
            </Row>
          </Container>
        </Col>
        <Col>


           {/* <table --------------------------- To reception.js------------
            className="table table-hover "
            style={{ margin: "20px", border: "solid", width: "100px" }}
          >
            <thead style={{ backgroundColor: "chartreuse" }}>
              <tr>
                <th>Ward type</th>
                <th>Beds Available</th>
                <th>Max Capacity</th>
              </tr>
            </thead>
            <tbody className="tableBody" style={{ backgroundColor: "bisque" }}>
              {wards.map((ward) => {
                return <WardTableSignIn ward={ward} />;
              })}
            </tbody>
          </table> --------------------------- To reception.js------------  */}
        </Col>
      </Row>
    </Container>
  );
};
export default SignIn;
