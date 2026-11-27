import numpy as np
import matplotlib.pyplot as plt
names = ['Alice', 'Bob', 'Cara', 'Dan', 'Eve']
balances = np.array([100, 250, 150, 400, 100])
plt.bar(names, balances)
plt.axhline(np.mean(balances), linestyle='--')
plt.ylabel('Balance (EUR)')
plt.title('Example account balances')
plt.savefig('balances.png', dpi=160, bbox_inches='tight')
plt.show()
