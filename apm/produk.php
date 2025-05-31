<?php
session_start();
include 'db_connect.php';

// Fetch categories for filter dropdown
$categories_result = $conn->query("SELECT DISTINCT category FROM products");

// Get selected category from query parameter
$selected_category = isset($_GET['category']) ? $_GET['category'] : '';

// Prepare product query with optional category filter
if ($selected_category && $selected_category !== 'all') {
    $stmt = $conn->prepare("SELECT * FROM products WHERE category = ?");
    $stmt->bind_param("s", $selected_category);
    $stmt->execute();
    $result = $stmt->get_result();
} else {
    $result = $conn->query("SELECT * FROM products");
}

include 'header.php'; // Kalau kamu sudah punya file header.php
?>

<?php if (isset($_GET['added']) && $_GET['added'] == 1): ?>
  <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
    <strong class="font-bold">Success!</strong>
    <span class="block sm:inline">Produk berhasil ditambahkan ke keranjang.</span>
  </div>
<?php endif; ?>

<div class="bg-yellow-100 min-h-screen py-12">
  <div class="container mx-auto px-4">
    <div class="text-center mb-6">
      <h2 class="text-3xl font-bold text-orange-600">Daftar Produk</h2>
      <form method="GET" class="mb-6 flex items-center justify-center space-x-2">
        <span class="text-gray-800 text-xs sm:text-sm font-semibold">Filter berdasarkan Kategori:</span>
        <select aria-label="Filter berdasarkan Kategori" name="category" id="category" onchange="this.form.submit()" class="border border-gray-300 rounded-md text-gray-800 text-xs sm:text-sm px-4 py-2 focus:outline-none focus:ring-2 focus:ring-orange-400 focus:border-orange-400 transition shadow-sm hover:shadow-md cursor-pointer">
          <option value="all" <?= $selected_category === 'all' || $selected_category === '' ? 'selected' : '' ?>>Semua Kategori</option>
          <?php while ($cat = $categories_result->fetch_assoc()): ?>
            <option value="<?= htmlspecialchars($cat['category']) ?>" <?= $selected_category === $cat['category'] ? 'selected' : '' ?>>
              <?= htmlspecialchars($cat['category']) ?>
            </option>
          <?php endwhile; ?>
        </select>
        <i class="fas fa-filter text-orange-500 text-lg"></i>
      </form>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
      <?php while ($row = $result->fetch_assoc()): ?>
        <div class="bg-white p-6 rounded-lg shadow-lg flex flex-col justify-between">
          <div>
          <img src="<?= $row['image'] ?? 'https://placehold.co/300x200' ?>" alt="<?= $row['description'] ?>" class="rounded-lg mb-4">
            <h3 class="text-xl font-semibold text-gray-800"><?= $row['name'] ?></h3>
            <p class="text-gray-600 mt-2"><?= $row['description'] ?></p>
            <p class="text-gray-500 italic mb-2">Category: <?= htmlspecialchars($row['category']) ?></p>
            <p class="text-orange-600 font-bold mt-4">Harga: Rp<?= number_format($row['price'], 0, ',', '.') ?></p>
          </div>

          <div class="flex items-center mt-4">
            <?php if (isset($_SESSION['user_id'])): ?>
              <form method="POST" action="add_to_cart.php" class="flex items-center w-full">
                <input type="hidden" name="product_id" value="<?= $row['id'] ?>">
                <input type="number" name="quantity" value="1" min="1" class="w-12 text-center border border-gray-300 rounded-md">
                <button type="submit" class="ml-4 px-4 py-2 bg-orange-500 text-white font-semibold rounded-full hover:bg-orange-600 transition">
                  Tambah ke Keranjang
                </button>
              </form>
            <?php else: ?>
              <a href="login.php" class="ml-4 px-4 py-2 bg-blue-500 text-white font-semibold rounded-full hover:bg-blue-600 transition">
                Login untuk memesan
              </a>
            <?php endif; ?>
          </div>
        </div>
      <?php endwhile; ?>
    </div>
  </div>
</div>

<?php include 'footer.php'; ?>
