<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;

class ProductSeeder extends Seeder
{
    public function run()
    {
        Product::create([
            'name' => 'Produit 1',
            'description' => 'Description du produit 1',
            'price' => 49.99,
        ]);

        Product::create([
            'name' => 'Produit 2',
            'description' => 'Description du produit 2',
            'price' => 29.99,
        ]);

        Product::create([
            'name' => 'Produit 3',
            'description' => 'Description du produit 3',
            'price' => 99.99,
        ]);
    }
}
