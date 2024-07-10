<!DOCTYPE html>
<html>
<head>
    <title>Analisa Gangguan Telekomunikasi</title>
    <style>
        body {
            background: linear-gradient(to bottom, #0000ff, #ffffff);
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }
        h1 {
            text-align: center;
            color: #0000ff;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            background: #0000ff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background: #0000cc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Masukkan Gejala Gangguan</h1>
        <form action="analyze.php" method="POST">
            <label for="symptoms">Gejala:</label>
            <textarea name="symptoms" id="symptoms" rows="4" cols="50"></textarea>
            <input type="submit" value="Analisa">
        </form>
    </div>
</body>
</html>