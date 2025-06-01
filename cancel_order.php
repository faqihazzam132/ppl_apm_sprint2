<?php
include 'db_connect.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['order_id'])) {
    $order_id = intval($_POST['order_id']);

    // Pastikan hanya user yg punya pesanan bisa batalin
    $check = mysqli_query($conn, "SELECT * FROM orders WHERE id = $order_id AND user_id = " . $_SESSION['user_id']);
    $order = mysqli_fetch_assoc($check);

    if ($order && $order['status'] == 'Menunggu') {
        mysqli_query($conn, "UPDATE orders SET status = 'Dibatalkan' WHERE id = $order_id");
    }
}

header("Location: my_orders.php");
exit();
?>
