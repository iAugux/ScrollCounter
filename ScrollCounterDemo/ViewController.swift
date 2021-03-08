//
//  ViewController.swift
//  ScrollCounterDemo
//
//  Created by Augus on 2021/3/8.
//  Copyright © 2021 Stokaty. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        leadingCouter.translatesAutoresizingMaskIntoConstraints = false
        centerCounter.translatesAutoresizingMaskIntoConstraints = false
        trailingCouter.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leadingCouter)
        view.addSubview(centerCounter)
        view.addSubview(trailingCouter)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            leadingCouter.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leadingCouter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerCounter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerCounter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            trailingCouter.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trailingCouter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 120),
        ])
    }

    private lazy var trailingCouter: NumberScrollCounter = {
        let counter = NumberScrollCounter(value: .zero, scrollDuration: 0.6, decimalPlaces: 2, prefix: "$", textColor: .black)
        counter.backgroundColor = .yellow
        return counter
    }()

    private lazy var leadingCouter: NumberScrollCounter = {
        let counter = NumberScrollCounter(value: .zero, scrollDuration: 0.6, decimalPlaces: 2, prefix: "$", textColor: .black)
        counter.backgroundColor = .blue
        return counter
    }()

    private lazy var centerCounter: NumberScrollCounter = {
        let counter = NumberScrollCounter(value: .zero, scrollDuration: 0.6, decimalPlaces: 2, prefix: "$", textColor: .black)
        counter.backgroundColor = .red
        return counter
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Random", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc
    private func handleButtonTapped() {
        leadingCouter.setValue(Float.random(in: 0...200))
        trailingCouter.setValue(Float.random(in: 0...200))
        centerCounter.setValue(Float.random(in: 0...200))
    }
}
