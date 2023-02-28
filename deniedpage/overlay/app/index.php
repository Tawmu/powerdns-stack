<?php
    $protocol = 'http://';
    if (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
        $protocol = 'https://';

    }
    $uri = $protocol . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>
            epic.LAN - Access Denied
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="/styles/reset.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="/styles/design.css" type="text/css" media="screen" />
    </head>
    <body>
        <div id="container">

            <div id="masthead">
                <img src="/images/logo.png" alt="epic.LAN" />
            </div>

            <h1>Access Denied</h1>
            <p>
                Access to <span class="url"><?php echo htmlentities($uri); ?></span> is blocked on our network.
            </p>
            <p>
                Please speak to a member of staff at the helpdesk if you think this is a mistake.
            </p>
    </body>
</html>
