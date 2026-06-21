
#### 2. `Firewall/iptables_setup.sh`

```bash
#!/bin/bash

# Настройка iptables для управления входящим и исходящим трафиком

# Очистка существующих правил
iptables -F

# Разрешить трафик на loopback интерфейсе
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Разрешить входящий трафик для установленных соединений
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Разрешить входящий трафик на порту 22 (SSH)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Запретить весь остальной входящий трафик
iptables -A INPUT -j DROP

# Разрешить весь исходящий трафик
iptables -A OUTPUT -j ACCEPT
