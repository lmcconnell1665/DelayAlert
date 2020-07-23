#!/usr/bin/env python

def main():
    """ the main function of the application """

    print("hello from container")
    return 1

def test_main():
    """ the test of the main function """
    assert main() == 1

if __name__ == '__main__':
    main()
