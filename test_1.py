import main

def test_print():
    assert main.greet() == "Hi"

def test_not():
    assert main.greet() == "Hi not"
