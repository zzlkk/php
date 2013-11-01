<?php 
session_start();
unset($_SESSION['cppassBSI']);
unset($_SESSION['cpusernameBSI']);
unset($_SESSION['cpuidBSI']); 
unset($_SESSION['cpaccessidBSI']); 
sleep(3);
header('Location: index.php?msglog=你成功退出');
exit;
?> 