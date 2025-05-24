import React, { useEffect, useState } from "react";
import Case from "../components/Case";

export default function Dashboard() {
    const [products, setProducts] = useState([]);

    useEffect(() => {
        document.title = "Tableau de bord";

        // Appel API pour récupérer les produits
        fetch("http://localhost:8000/api/products")  // adapte l'URL selon ton backend
            .then((res) => res.json())
            .then((data) => setProducts(data))
            .catch((err) => console.error("Erreur chargement produits:", err));
    }, []);

    return (
        <Case>
            <div className="section-header px-4 tw-rounded-none tw-shadow-md tw-shadow-gray-200 lg:tw-rounded-lg">
                <h1 className="mb-1 tw-text-lg">Tableau de bord</h1>
            </div>

            <div className="section-body">
                <div className="card">
                    <div className="card-body px-0">
                        <h3>Liste des produits</h3>
                        <table className="table-auto w-full border-collapse border border-gray-200">
                            <thead>
                                <tr>
                                    <th className="border border-gray-300 px-4 py-2">ID</th>
                                    <th className="border border-gray-300 px-4 py-2">Nom</th>
                                    <th className="border border-gray-300 px-4 py-2">Description</th>
                                    <th className="border border-gray-300 px-4 py-2">Prix</th>
                                </tr>
                            </thead>
                            <tbody>
                                {products.length === 0 && (
                                    <tr>
                                        <td colSpan="4" className="text-center py-4">Aucun produit trouvé</td>
                                    </tr>
                                )}
                                {products.map((product) => (
                                    <tr key={product.id}>
                                        <td className="border border-gray-300 px-4 py-2">{product.id}</td>
                                        <td className="border border-gray-300 px-4 py-2">{product.name}</td>
                                        <td className="border border-gray-300 px-4 py-2">{product.description}</td>
                                        <td className="border border-gray-300 px-4 py-2">{product.price} €</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </Case>
    );
}
