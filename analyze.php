<?php
include 'db.php';

$symptoms = $_POST['symptoms'];

// Menghilangkan karakter khusus untuk mencegah SQL Injection
$symptoms = $conn->real_escape_string($symptoms);

// Memecah gejala menjadi kata-kata kunci
$keywords = explode(" ", $symptoms);
$conditions = array();

foreach ($keywords as $keyword) {
    $conditions[] = "symptoms LIKE '%$keyword%'";
}

$sql_condition = implode(" OR ", $conditions);

// Query untuk mencari gangguan yang sesuai dengan gejala
$sql = "SELECT * FROM issues WHERE $sql_condition";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<style>
        body {
            background: linear-gradient(to bottom, #87CEEB, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>";
    echo "<div class='container'><h1>Hasil Analisis</h1>";
    while($row = $result->fetch_assoc()) {
        echo "<h2>Gangguan: " . $row["issue_name"]. "</h2>";
        $issue_id = $row["id"];
        
        // Mencari solusi untuk gangguan tersebut
        $solution_sql = "SELECT * FROM solutions WHERE issue_id = $issue_id";
        $solution_result = $conn->query($solution_sql);
        
        if ($solution_result->num_rows > 0) {
            echo "<h3>Solusi:</h3><ul>";
            while($solution_row = $solution_result->fetch_assoc()) {
                echo "<li>" . $solution_row["solution"]. "</li>";
            }
            echo "</ul>";
        } else {
            echo "Tidak ada solusi yang ditemukan.";
        }
        
    }
    echo '<br><a href="index.php"><button>Kembali</button></a>';
    echo "</div>";
} else {
    echo "<style>
        body {
            background: linear-gradient(to bottom, #87CEEB, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>";
    echo "<div class='container'><h1>Hasil Analisis</h1>";
    echo "Tidak ada gangguan yang sesuai dengan gejala yang dimasukkan.";
    echo "</div>";
}

$conn->close();
?>