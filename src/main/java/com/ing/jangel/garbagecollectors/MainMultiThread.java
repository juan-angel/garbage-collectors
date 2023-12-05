package com.ing.jangel.garbagecollectors;

import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.stream.IntStream;

public class MainMultiThread {

	public static void main(String[] args) throws InterruptedException {
		System.out.println("Initializing");
		Thread.sleep(15000);
		var executorService = Executors.newFixedThreadPool(5);

		var d = System.currentTimeMillis();

		IntStream.iterate(0, i -> i < 10, i -> ++i).forEach(i -> executorService.execute(new MemoryConsumer(i)));
		executorService.shutdown();
	    executorService.awaitTermination(1000, TimeUnit.SECONDS);

		System.out.println("Time: " + (System.currentTimeMillis() - d) + "ms.");
		Thread.sleep(15000);
	}

	private static class MemoryConsumer implements Runnable {
		private int from;

		public MemoryConsumer(int from) {
			this.from = from;
		}

		@Override
		public void run() {
			IntStream.iterate(from * 100, i -> i < (from * 100) + 100, i -> ++i).forEach(i -> {
				var x = new byte[1024 * 1024 * 200]; // Allocate 100MB
				System.out.println("iteration=> " + (i + 1));

				if ((i + 1) % 100 == 0) { // Suggest GC to run every 100 iterations
					System.gc();
				}
			});
		}
	}
}
