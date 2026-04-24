// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaMozambique
 * @dev Registro de emulsiones lipidicas y transferencia de calor por capsaicina.
 * Serie: Sabores de Africa (53/55)
 */
contract CulturaMozambique {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 saturacionLipidica;  // Calidad de la emulsión de coco (1-100)
        uint256 indicePiriPiri;      // Intensidad de la capsaicina (1-10)
        bool usaMariscoFresco;       // Validador de origen costero
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con la Galinha à Zambeziana
        registrarPlato(
            "Galinha a Zambeziana", 
            "Pollo, leche de coco, piri-piri, ajo, limon.",
            "Marinado en infusion de coco y chiles para una transferencia de sabor profunda por via lipidica.",
            90, 
            8, 
            false
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _saturacion, 
        uint256 _indice,
        bool _marisco
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            saturacionLipidica: _saturacion,
            indicePiriPiri: _indice,
            usaMariscoFresco: _marisco,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
