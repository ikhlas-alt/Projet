<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Gallery;

class GallerySeeder extends Seeder
{
    public function run()
    {
        Gallery::create([
            'name_gallery' => 'Galerie Nature',
            'description_gallery' => 'Photos de la nature',
            'image' => 'nature1.jpg',
        ]);

        Gallery::create([
            'name_gallery' => 'Galerie Ville',
            'description_gallery' => 'Photos de la ville',
            'image' => 'city1.jpg',
        ]);
    }
}
