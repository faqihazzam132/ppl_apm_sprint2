<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Agro Pangan Maju</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
  <style>
    body { font-family: 'Poppins', sans-serif; }
    .cursor::after { content: "|"; animation: blink 1s infinite; color: red; }
    @keyframes blink { 0%, 100% { opacity: 1; } 50% { opacity: 0; } }
  </style>
</head>
<body class="bg-white text-gray-800">
  <!-- Header -->
  <header class="bg-white shadow-md">
    <div class="container mx-auto flex justify-between items-center py-4 px-6">
      <div class="flex items-center">
        <img src="image/logo.png" alt="Agro Pangan Maju logo" class="h-10 w-10">
        <span class="ml-2 text-red-700 font-bold text-lg">Agro Pangan Maju</span>
      </div>
      <nav class="flex items-center space-x-6 text-gray-700 text-sm sm:text-base relative">
        <?php
          $current_page = basename($_SERVER['PHP_SELF']);
          function nav_link($page, $label, $icon) {
            global $current_page;
            $is_active = ($current_page === $page) ? 'text-red-700 font-bold' : 'hover:text-red-700 transition text-gray-700';
            return "<a href=\"$page\" class=\"flex items-center space-x-1 $is_active\"><i class=\"$icon\"></i><span>$label</span></a>";
          }
        ?>
        <?php if (isset($_SESSION['user_id'])): ?>
          <?= nav_link('index.php', 'Beranda', 'fas fa-home') ?>
          <?= nav_link('produk.php', 'Produk', 'fas fa-box-open') ?>
          <?= nav_link('my_orders.php', 'My Order', 'fas fa-shopping-bag') ?>
          <?= nav_link('cart.php', 'Keranjang', 'fas fa-shopping-cart') ?>
          <div class="relative" id="user-menu-container">
           <button aria-expanded="false" aria-haspopup="true" class="text-gray-700 hover:text-red-700 focus:outline-none focus:ring-2 focus:ring-red-700 rounded-full p-1" id="user-menu-button" onclick="toggleUserMenu()" type="button">
            <i class="fas fa-user-circle fa-lg"></i>
           </button>
           <div aria-labelledby="user-menu-button" class="hidden absolute right-0 mt-2 w-40 bg-white border border-gray-200 rounded-md shadow-lg py-2 z-50" id="user-menu">
            <p class="px-4 py-2 text-gray-900 font-semibold border-b border-gray-200" id="user-name">
             <?= htmlspecialchars($_SESSION['role']) ?>
            </p>
            <button class="w-full text-left px-4 py-2 text-red-700 font-semibold hover:bg-red-50" onclick="logout()">
             Logout
            </button>
           </div>
          </div>
          <script>
           
            chatForm.addEventListener('submit', e => {
              e.preventDefault();
              const message = chatInput.value.trim();
              if (!message) return;
              fetch('chat_send.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({ receiver_id: 1, message })
              }).then(() => {
                chatInput.value = '';
                fetchMessages();
              });
            });
          </script>
        <?php else: ?>
          <?= nav_link('index.php', 'Beranda', 'fas fa-home') ?>
          <?= nav_link('produk.php', 'Produk', 'fas fa-box-open') ?>
          <a href="login.php" class="flex items-center space-x-1 hover:text-red-700 transition text-gray-700">
            <i class="fas fa-sign-in-alt"></i>
            <span>Login</span>
          </a>
        <?php endif; ?>
      </nav>
    </div>
  </header>
  <script>
    function toggleUserMenu() {
      const menu = document.getElementById('user-menu');
      if (menu.classList.contains('hidden')) {
        menu.classList.remove('hidden');
      } else {
        menu.classList.add('hidden');
      }
    }
    function logout() {
      window.location.href = 'logout.php';
    }
  </script>
</body>
</html>
