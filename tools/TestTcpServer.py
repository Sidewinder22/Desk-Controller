#!/usr/bin/python3

import socket

HOST = "127.0.0.1"
# HOST = "0.0.0.0"
PORT = 9999

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    conn, addr = s.accept()

    try:
        with conn:
            print(f"Client connected: {addr}")
            while True:
                data = conn.recv(1024)
                if not data:
                    break

                print(f"Data received from client {data}")
                message = b"Hello from test server!"

                conn.sendall(message)

    finally:
        conn.close()
        print("Socket closed")
