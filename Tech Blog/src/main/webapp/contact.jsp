<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #3498db;
            color: #fff;
            text-align: center;
            padding: 20px;
            
        }

        h1 {
            margin-bottom: 20px;
            font-size: 2em;
            color: #333;
        }

        p {
            font-size: 1.1em;
            line-height: 1.6;
            color: #555;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        textarea {
            height: 150px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        button:hover {
            background-color: #45a049;
        }

        .contact-info {
            text-align: center;
            margin-top: 20px;
            font-size: 1.2em;
        }

        .contact-info i {
            color: #3498db;
            margin-right: 8px;
        }

        .animated-character {
            max-width: 100%;
            height: auto;
            animation: floatAnimation 5s infinite alternate;
        }

        @keyframes floatAnimation {
            0% {
                transform: translateY(10);
            }
            100% {
                transform: translateY(-500px);
            }
        }
    </style>
</head>
<body>

    <header >
        <h1>Contact Us</h1>
    </header>

    <div class="contact-info">
        <p><i class="fas fa-envelope"></i>Email: <a href="mailto:shubhammotwani2511@gmail.com">shubhammotwani2511@gmail.com</a></p>
    </div>

    <form action="" method="post">
        <label for="name">Your Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Your Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="message">Your Message:</label>
        <textarea id="message" name="message" required></textarea>

        <button type="submit">Submit</button>
    </form>

</body>
</html>
