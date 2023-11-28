package com.ing.jangel.garbagecollectors;

import java.util.stream.IntStream;

public class Main {

	public static void main(String[] args) throws InterruptedException {
		System.out.println("Initializing");
		Thread.sleep(15000);

		var d = System.currentTimeMillis();

		IntStream.iterate(0, i -> ++i).limit(500).forEach(i -> {
			var x = new byte[1024 * 1024 * 100]; // Allocate 100MB
			System.out.println("iteration=> " + (i + 1));

			if ((i + 1) % 100 == 0) { // Suggest GC to run every 100 iterations
				System.gc();
			}
		});

		System.out.println("Time: " + (System.currentTimeMillis() - d));
	}

}
