//
//  EstudiarViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 24/05/21.
//

import UIKit

class EstudiarViewController: UIViewController {
    
    //MARK: - VARIABLES
    @IBOutlet weak var canvasView: UIView!
    @IBOutlet weak var lbRespuesta: UILabel!
    @IBOutlet weak var lbSignificados: UILabel!
    @IBOutlet weak var lbLecturas: UILabel!
    @IBOutlet weak var btnIncorrecto: UIButton!
    @IBOutlet weak var btnCorrecto: UIButton!
    
    var listaKanji = [KanjiUsuario]()
    var path = UIBezierPath()
    var startPoint = CGPoint()
    var touchPoint = CGPoint()
    
    var kanjiActual : Int = 0

    //MARK: - CARGAR LA VISTA
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configuración del canvas
        canvasView.clipsToBounds = true
        canvasView.isMultipleTouchEnabled = false
        
        //Configurar el contenido inicial de los labels
        lbLecturas.text = listaKanji[kanjiActual].pronunciacion
        lbSignificados.text = listaKanji[kanjiActual].significado
        lbRespuesta.text = ""
        
        //Esconder inicialmente los botones
        btnIncorrecto.isHidden = true
        btnCorrecto.isHidden = true
    }
    
    //MARK: - CONFIGURACION DEL CANVAS
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: canvasView){
            startPoint = point
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: canvasView){
            touchPoint = point
        }
        path.move(to: startPoint)
        path.addLine(to: touchPoint)
        startPoint = touchPoint
        
        //Dibujar
        draw()
    }
    
    func draw() {
        let strokeLayer = CAShapeLayer()
        strokeLayer.fillColor = nil
        strokeLayer.strokeColor = UIColor.black.cgColor
        strokeLayer.lineWidth = 5
        strokeLayer.path = path.cgPath
        canvasView.layer.addSublayer(strokeLayer)
        canvasView.setNeedsDisplay()
    }
    
    func borrarCanvas(){
        path.removeAllPoints()
        canvasView.layer.sublayers = nil
        canvasView.setNeedsDisplay()
    }
    
    //MARK: - FUNCIONES
    
    func mostrarBotones() {
        btnCorrecto.isHidden = false
        btnIncorrecto.isHidden = false
    }
    
    func esconderBotones() {
        btnCorrecto.isHidden = true
        btnIncorrecto.isHidden = true
    }
    
    
    //MARK: - CONFIGURACION DE LOS BOTONES
    @IBAction func mostrarRespuesta(_ sender: UIButton) {
        lbRespuesta.text = listaKanji[kanjiActual].caracter
        mostrarBotones()
    }
    
    @IBAction func limpiarCanvas(_ sender: UIButton) {
        borrarCanvas()
    }
    
    @IBAction func respuestaIncorrecta(_ sender: UIButton) {
        borrarCanvas()
        lbRespuesta.text = ""
        esconderBotones()
    }
    
    @IBAction func respuestaCorrecta(_ sender: UIButton) {
        borrarCanvas()
        if kanjiActual+1 < listaKanji.count {
            kanjiActual += 1
            lbLecturas.text = listaKanji[kanjiActual].pronunciacion
            lbSignificados.text = listaKanji[kanjiActual].significado
            lbRespuesta.text = ""
            esconderBotones()
        } else {
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
