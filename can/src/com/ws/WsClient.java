package com.ws;

import java.net.URI;
import java.net.URISyntaxException;
import java.nio.ByteBuffer;

import org.java_websocket.client.WebSocketClient;
import org.java_websocket.drafts.Draft;
import org.java_websocket.handshake.ServerHandshake;

public class WsClient extends WebSocketClient {

	public WsClient(URI serverUri, Draft draft) {
		super(serverUri, draft);
	}

	public WsClient(URI serverURI) {
		super(serverURI);
	}

	@Override
	public void onOpen(ServerHandshake handshakedata) {
		
		send("Hello, it is me :)");
		System.out.println("new connection opened");
	}

	@Override
	public void onClose(int code, String reason, boolean remote) {
		System.out.println("closed with exit code " + code + " additional info: " + reason);
	}

	@Override
	public void onMessage(String message) {
		System.out.println("received message(ws): " + message);
	}

	@Override
	public void onMessage(ByteBuffer message) {
		System.out.println("received ByteBuffer");
		System.out.println(" : " + message);
	}

	@Override
	public void onError(Exception ex) {
		System.err.println("an error occurred:" + ex);
	}

	public static void main(String[] args) throws URISyntaxException {		
		WebSocketClient client = new WsClient(new URI("ws://3.35.240.16:88/chatting"));
		client.connect();
	}
}
