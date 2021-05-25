//
//  EstudiarViewController.swift
//  Hajime
//
//  Created by Cesar Martinez Valenzuela on 24/05/21.
//

import UIKit

class EstudiarViewController: UIViewController {
    
    
    @IBOutlet weak var canvasView: UIView!
    @IBOutlet weak var lbRespuesta: UILabel!
    @IBOutlet weak var lbSignificados: UILabel!
    @IBOutlet weak var lbLecturas: UILabel!
    
    var listaKanji = [KanjiUsuario]()
    var path = UIBezierPath()
    var startPoint = CGPoint()
    var touchPoint = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configuración del canvas
        canvasView.clipsToBounds = true
        canvasView.isMultipleTouchEnabled = false
    }
    
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
    
    
    @IBAction func mostrarRespuesta(_ sender: UIButton) {
    }
    @IBAction func limpiarCanvas(_ sender: UIButton) {
    }
    @IBAction func respuestaIncorrecta(_ sender: UIButton) {
    }
    @IBAction func respuestaCorrecta(_ sender: UIButton) {
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
