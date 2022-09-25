import React from "react";
import  "./wardTable.css"

const ReceptionWardTableSignIn = (props) => {
  const { ward } = props;
  return (
    <tr>
      <td >{ward.type}</td>
      <td>{ward.maxCapacity - ward.availability}</td>
      <td>{ward.maxCapacity}</td>
    </tr>
  );
};

export default ReceptionWardTableSignIn;