<!DOCTYPE html>
<html>
<head>
  <title>Random Data Table</title>
  
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color:rgb(227, 227, 227);
    }
    
    table {
      border-collapse: collapse;
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      margin-top: 10%;
      background-color: rgb(199, 198, 198);
    }
    
    th {
      background-color: #343434;
      text-align: left;
      padding: 8px;
      color : #ddd;
    }
    
    td {
      border-bottom: 1px solid #ddd;
      padding: 8px;
    }
    
    tr:hover {
      background-color: rgb(55, 90, 60);
      cursor: pointer; /* Change the cursor to indicate the row is clickable */
    }
    td:nth-child(2):before {
      content: '';
      display: inline-block;
      width: 10px;
      height: 10px;
      background-color: #8000ff;
      border-radius: 50%;
      margin-right: 8px;
    }
    
    .event-name {
      font-weight: bold;
    }
    
    .event-time {
      color: #666;
    }
    
    .event-location {
      color: #999;
    }
  </style>
  <style>
    /* CSS styles for table and cells */
    table {
      border-collapse: collapse;
      width: 100%;
    }

    th {
      background-color: #2c2c2c;
    }

    .ok{
        text-align: center;
    }
    /* Reset default styles for links */
a {
  text-decoration: none;
  display: inline-block;
  margin-left: 46%;
}

/* Circular button styles */
.circular-button {
  display: inline-block;
  width: 50px; /* Adjust the width and height to make the button larger or smaller */
  height: 50px;
  border-radius: 50%; /* Make it a circle by setting the border-radius to 50% of the width/height */
  background-color: rgb(199, 198, 198);; /* Set your desired background color */
  color: #7419cf; /* Set the text color */
  text-align: center;
  line-height: 50px; /* Vertically center the text inside the button */
}

/* Hover effect - Optional */
.circular-button:hover {
  background-color: #0056b3;
  color:yellow; /* Change the background color on hover */
}

  </style>
</head>
<body>
  <table>
    <thead>
      <tr>
        <th class="ok"><input type="checkbox" id="selectAll" onclick="selectAllCheckboxes()" checked/></th>
        <th>Name</th>
        <th>Phone</th>
        <th>Room</th>
        <th>Not Found</th>
      </tr>
    </thead>
    <tbody id="tableBody">
      <!-- Rows will be dynamically generated here -->
    </tbody>
  </table>
    <br><a href="#" class="circular-button" onclick = "calculate()">Click</a>
  <script>
    // Function to generate a random name
    function getRandomName() {
      const names = ["John", "Emma", "Michael", "Sophia", "Daniel", "Olivia", "David", "Ava", "Matthew", "Isabella"];
      return names[Math.floor(Math.random() * names.length)];
    }

    // Function to generate a random phone number
    function getRandomPhone() {
      const phonePrefix = ["(120)", "(406)", "(789)","(350)"];
      const randomNumber = Math.floor(Math.random() * 1000000).toString().padStart(7, "0");
      return "000"+randomNumber;
    }

    // Function to generate a random room number
    function getRandomRoom() {
      const building = ["A", "B", "C", "D", "E"];
      const roomNumber = Math.floor(Math.random() * 300) + 100;
      return `Block ${building[Math.floor(Math.random() * building.length)]} ${roomNumber}`;
    }

    // Function to generate a random boolean (for "room not found" checkbox)
    function getRandomBool() {
      return Math.random() < 0.5;
    }

    // Function to generate a random row of data
    function generateRandomRow() {
      const name = getRandomName();
      const phone = getRandomPhone();
      const room = getRandomRoom();
      const isRoomNotFound = getRandomBool();

      return `
        <tr>
          <td align="center"><input type="checkbox" class="checkbox-row" onchange="checkSelectAll()"/></td>
          <td class="event-name">${name}</td>
          <td>${phone}</td>
          <td>${room}</td>
          <td align="center"><input type="checkbox" class="checkbox-not-found" onchange="notFound()"} /></td>
        </tr>
      `;
    }

    // Function to generate 20 random rows and insert them into the table
    function generateRandomRows() {
      const tableBody = document.getElementById("tableBody");
      let rows = "";
      for (let i = 0; i < 10; i++) {
        rows += generateRandomRow();
      }
      tableBody.innerHTML = rows;
    }
   generateRandomRows();
  </script>

<script>
    function selectAllCheckboxes() {
        const selectAllCheckbox = document.getElementById('selectAll');
        const checkboxes = document.getElementsByClassName('checkbox-row');
        const notFound = document.getElementsByClassName('checkbox-not-found');
        //const isChecked = selectAllCheckbox.checked;

        for (let i = 0; i < checkboxes.length; i++) {
            if(selectAllCheckbox.checked == true){
                checkboxes[i].checked = true;
                notFound[i].checked = false;
            }else{
                checkboxes[i].checked = false;
                notFound[i].checked = true;
            }
        }
    }

    function checkSelectAll() {
        const selectAllCheckbox = document.getElementById('selectAll');
        const checkboxes = document.getElementsByClassName('checkbox-row');
        const notFound = document.getElementsByClassName('checkbox-not-found');
        let allChecked = true;

        for (let i = 0; i < checkboxes.length; i++) {
            if (!checkboxes[i].checked) {
                allChecked = false;
                notFound[i].checked = true;
            }else{
                notFound[i].checked = false;
            }
        }
        selectAllCheckbox.checked = allChecked;
    }

    function notFound(){
        const selectAllCheckbox = document.getElementById('selectAll');
        const checkboxes = document.getElementsByClassName('checkbox-row');
        const notFound = document.getElementsByClassName('checkbox-not-found');
        let allChecked = true;
        for (let i = 0; i < notFound.length; i++) {
            if(notFound[i].checked == true){
                checkboxes[i].checked = false;
                allChecked = false;
            }else{
                checkboxes[i].checked = true;
            }
        }
        selectAllCheckbox.checked = allChecked;
    }

    function calculate() {
  const checkboxes = document.getElementsByClassName('checkbox-row');
  const notFoundCheckboxes = document.getElementsByClassName('checkbox-not-found');

  const checkedCheckinRows = [];
  const checkedNotFoundRows = [];

  for (let i = 0; i < checkboxes.length; i++) {
    if (checkboxes[i].checked && !notFoundCheckboxes[i].checked) {
      checkedCheckinRows.push(i);
    } else if (notFoundCheckboxes[i].checked && !checkboxes[i].checked) {
      checkedNotFoundRows.push(i);
    }
  }

  const resultWindow = window.open('', 'Checkin and Not Found Rows', 'width=600,height=400');
  resultWindow.document.write('<head><link rel="stylesheet" type="text/css" href="pages/style.css"></head>')
  resultWindow.document.write('<h1>Checked Checkin Rows:</h1>');
  resultWindow.document.write('<table>');
  resultWindow.document.write('<thead><tr><th>Name</th><th>Phone</th><th>Room</th></tr></thead>');
  resultWindow.document.write('<tbody>');
  checkedCheckinRows.forEach((rowIndex) => {
    const row = document.getElementById('tableBody').children[rowIndex];
    const name = row.cells[1].textContent;
    const phone = row.cells[2].textContent;
    const room = row.cells[3].textContent;
    resultWindow.document.write(`<tr><td>${name}</td><td>${phone}</td><td>${room}</td></tr>`);
  });
  resultWindow.document.write('</tbody></table>');
  resultWindow.document.write('<h1>Checked Not Found Rows:</h1>');
  resultWindow.document.write('<table border="1">');
  resultWindow.document.write('<thead><tr><th>Name</th><th>Phone</th><th>Room</th></tr></thead>');
  resultWindow.document.write('<tbody>');
  checkedNotFoundRows.forEach((rowIndex) => {
    const row = document.getElementById('tableBody').children[rowIndex];
    const name = row.cells[1].textContent;
    const phone = row.cells[2].textContent;
    const room = row.cells[3].textContent;
    resultWindow.document.write(`<tr><td>${name}</td><td>${phone}</td><td>${room}</td></tr>`);
  });
  resultWindow.document.write('</tbody></table>');
}

selectAllCheckboxes();
</script>
</body>
</html>
