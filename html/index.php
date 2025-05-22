<!DOCTYPE html>
<html>

<head>
    <title>Lecture Notes</title>

    <link rel="stylesheet" href="https://nathcat.net/static/css/new-common.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <style>
        .dir h3{
            margin-left: 100px;
        }
    </style>
</head>

<body>
    <div id="page-content" class="content">
        <?php include("header.php"); ?>

        <div class="main">
            <div class="content-card">
                <h1>Welcome to my Lecture Notes!</h1>
                <p>
                    Here you will find all the lecture notes I made as part of my course at the University of Sussex.
                </p>
                <p>
                    I started at Sussex in 2023, however I changed the way I made my lecture notes so many times that
                    a lot of my earlier work won't be found here right now, over time I will be working on collating
                    all of my work at University onto this page.
                </p>
            </div>

            <?php
            $dir = scandir(".");
            foreach ($dir as $file) {
                if ($file === "." || $file === ".." || !is_dir($file)) continue;

                echo "<div class=\"content-card dir\"><h2>$file</h2>";

                $sub_dir = scandir($file);
                foreach ($sub_dir as $sub_file) {
                    if ($sub_file === "." || $sub_file === ".." || !is_dir($file . "/" . $sub_file)) continue;

                    echo "<h3><a href=\"" . $file . "/" . $sub_file . "\">$sub_file</a></h3>";
                }

                echo "</div>";
            }
            ?>
        </div>

        <?php include("footer.php"); ?>
    </div>
</body>

</html>