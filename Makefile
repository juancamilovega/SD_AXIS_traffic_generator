example: ips
	make -C examples
ips:
	make -C ip_repo
clean:
	make -C examples clean
	make -C ip_repo clean
