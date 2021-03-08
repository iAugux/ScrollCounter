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
        counter.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(counter)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            counter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 120),
        ])
    }

    private lazy var counter: NumberScrollCounter = {
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
        counter.setValue(Float.random(in: 0...200))
    }
}
