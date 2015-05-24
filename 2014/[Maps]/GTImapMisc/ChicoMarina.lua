if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(6280, 75, -1796.7, -3, 0, 0.445, 294),
	createObject(17029, 71.2002, -1693.9, -10.1, 0, 0, 39.996),
	createObject(17029, 34.7, -1710.3, -10.1, 0, 0, 39.996),
	createObject(17033, 8.4, -1721.7, 0, 0, 0, 0),
	createObject(17033, 93.7, -1699.8, 0, 0, 0, 52),
	createObject(17033, 95.3, -1714.2, 0, 0, 0, 51.998),
	createObject(17026, 7, -1720.2, -15, 0, 0, 259.997),
	createObject(3862, 142.7002, -1822.1, 2.8, 0, 0, 24),
	createObject(3863, 139.3, -1823.6, 2.8, 0, 0, 24),
	createObject(3860, 135.7998, -1825.1, 2.8, 0, 0, 24),
	createObject(3861, 132.3, -1826.6, 2.7, 0, 0, 24),
	createObject(3861, 128.6, -1828.2, 2.7, 0, 0, 24),
	createObject(1340, 120.9, -1840, 2.4, 0, 0, 24),
	createObject(1346, 128.3, -1858.7, 2.5, 0, 0, 114),
	createObject(1342, 125.6, -1850.8, 2.3, 0, 0, 24),
	createObject(1341, 132.4004, -1865, 2.1, 0, 0, 24),
	createObject(3460, 122.2, -1833.1, 5.3, 0, 0, 293),
	createObject(3460, 127.3, -1844.5, 5.2, 0, 0, 293),
	createObject(3460, 132.6, -1856.6, 5.1, 0, 0, 293),
	createObject(3460, 137.8, -1868.4, 5, 0, 0, 293),
	createObject(1280, 122.2, -1845.8, 1.6, 0, 0, 204),
	createObject(1280, 117.6, -1835.4, 1.7, 0, 0, 204),
	createObject(1280, 129.6, -1862.2, 1.5, 0, 0, 204),
	createObject(1280, 133.9, -1872.1, 1.4, 0, 0, 204),
	createObject(3863, 124.9, -1829.9, 2.7, 0, 0, 24),
	createObject(910, 121.2, -1830.2, 2.8, 0, 0, 24),
	createObject(1440, 122.3, -1831.9, 2, 0, 0, 0),
	createObject(1359, 118.3, -1837.2, 2, 0, 0, 0),
	createObject(1359, 123, -1847.5, 1.9, 0, 0, 0),
	createObject(1359, 130.2998, -1863.9, 1.8, 0, 0, 0),
	createObject(1359, 134.8, -1874, 1.7, 0, 0, 0),
	createObject(1265, 122.7, -1830.5, 2, 0, 0, 0),
	createObject(3615, 99.7, -1868.1, 2.3, 0, 0, 294),
	createObject(3615, 83.9, -1831.1, 2.39, 0, 0, 294),
	createObject(3615, 66.8, -1791.9, 2.6, 0, 0, 294),
	createObject(17953, 98.5996, -1897.6, -2.7, 0, 358.995, 24),
	createObject(1461, 132.2, -1868.1, 1.9, 0, 0, 113),
	createObject(3886, 116.2998, -1923.6, 0.1, 0, 0, 179.495),
	createObject(906, 143.8, -1875.8, 0.5, 0, 0, 0),
	createObject(906, 111.7002, -1891.2, 0, 0, 0, 0),
	createObject(906, 115.9, -1889.1, 0, 0, 0, 0),
	createObject(1474, 146.6, -1832.9, 1.9, 0, 0, 270),
	createObject(1474, 144.9, -1832.9, 1.1, 0, 0, 270),
	createObject(1474, 148.4, -1832.9, 1.9, 0, 0, 90),
	createObject(1461, 43.4, -1754.5, 1.9, 0, 0, 294),
	createObject(1474, 148.2002, -1909.7, 1.9, 0, 0, 90),
	createObject(1474, 146.3, -1909.7, 1.9, 0, 0, 270),
	createObject(1474, 144.5498, -1909.7, 1.1, 0, 0, 270),
	createObject(2404, 144, -1848.1, 2.9, 0, 0, 267.995),
	createObject(2404, 147.1, -1841, 3, 0, 0, 267.995),
	createObject(2405, 147.1, -1841.7, 3, 0, 0, 268),
	createObject(2406, 147.1, -1842.4, 3, 0, 0, 268),
	createObject(2406, 147.0996, -1843.1, 3, 0, 0, 267.995),
	createObject(2405, 147.1, -1843.8, 2.9, 0, 0, 267.995),
	createObject(1461, 61.8, -1794.7, 1.4, 0, 0, 294),
	createObject(2405, 144, -1847.5, 2.9, 0, 0, 267.995),
	createObject(3860, 145.5, -1846.5, 2.8, 0, 0, 268),
	createObject(1461, 78.7, -1834.1, 1, 0, 0, 294),
	createObject(2406, 144, -1846.9, 2.9, 0, 0, 267.995),
	createObject(1639, 78.5, -1733.1, 2.1, 0, 0, 204.747),
	createObject(2221, 135.7, -1825.9, 2.52, 0, 0, 24),
	createObject(2223, 136.2, -1825.68, 2.51, 0, 0, 24),
	createObject(2425, 137.2, -1825.3, 2.42, 0, 0, 24),
	createObject(2453, 135.1, -1826.5, 2.8, 0, 0, 24),
	createObject(3615, 48, -1751.6, 3.3, 0, 0, 294),
	createObject(2214, 138.8, -1824.7, 2.5057, 333.5, 22, 0),
	createObject(1639, 64, -1739.7, 2.1, 0, 0, 204.747),
	createObject(1646, 81.1, -1840.8, 0.7, 0, 0, 294),
	createObject(2214, 139.3, -1824.4, 2.5057, 333.496, 21.995, 0),
	createObject(2683, 140.8, -1824.1, 2.6, 0, 0, 0),
	createObject(1646, 72.8, -1797.1, 1.2, 0, 0, 294),
	createObject(1646, 75.1, -1802.4, 1, 0, 0, 294),
	createObject(2768, 140.1, -1824.2, 2.5, 0, 0, 0),
	createObject(1646, 77.6, -1807.6, 1, 1.25, 0, 294),
	createObject(1646, 80.2, -1813, 1.1, 0, 0, 294),
	createObject(1646, 86.7, -1810, 1.2, 0, 0, 294),
	createObject(2768, 140.3, -1824.1, 2.5, 0, 0, 0),
	createObject(1646, 82.2, -1799.5, 1.2, 0, 0, 294),
	createObject(2663, 139.8, -1824.2, 2.7, 0, 0, 0),
	createObject(1646, 79.7, -1794, 1.2, 0, 0, 294),
	createObject(2390, 142, -1823.3, 3.4556, 0, 0, 24),
	createObject(1646, 84.2002, -1804.7, 1.2, 0, 0, 294),
	createObject(2391, 142.5, -1823.089, 3.4556, 0, 0, 24),
	createObject(1281, 114.9, -1859.2, 1.6, 0, 358, 20),
	createObject(1255, 54.9, -1761.4, 1.78, 0, 0, 200),
	createObject(1255, 56.6, -1765.9, 1.68, 0, 0, 199.995),
	createObject(1255, 58.7, -1771.6, 1.56, 0, 0, 199.995),
	createObject(1255, 60.7, -1777.1, 1.56, 0, 0, 199.995),
	createObject(1640, 45.7, -1776, 0.8, 0, 0, 300),
	createObject(2392, 143, -1822.7, 3.4556, 0, 0, 24),
	createObject(2396, 143.8, -1822.6, 3.4556, 0, 0, 24),
	createObject(1640, 45.6, -1770.9, 0.9, 0, 0, 299.998),
	createObject(1640, 51.4, -1777.2, 0.9, 0, 0, 299.998),
	createObject(1640, 49.9004, -1783.4, 0.7, 0, 0, 299.993),
	createObject(1640, 46.9, -1763.3, 1.1, 0, 0, 299.998),
	createObject(1640, 41.6, -1769.8, 1.1, 0, 0, 299.998),
	createObject(1640, 49.9, -1769.9, 1.1, 0, 0, 299.998),
	createObject(1640, 55.1, -1781.9, 0.9, 0, 0, 299.998),
	createObject(2398, 131.8, -1827.8, 3.3699, 0, 0, 24),
	createObject(2399, 132.6, -1827.5, 3.3699, 0, 0, 24),
	createObject(2401, 133.5, -1827, 3.3699, 0, 0, 24),
	createObject(2689, 128.1, -1829.4, 3.454, 0, 0, 24),
	createObject(2704, 128.8, -1829.2, 3.454, 0, 0, 24),
	createObject(2705, 129.5, -1829, 3.454, 0, 0, 24),
	createObject(2706, 130.1, -1828.7, 3.454, 0, 0, 24),
	createObject(1520, 125.7, -1830.5, 2.3, 0, 0, 0),
	createObject(621, 125.2, -1813.7, 1.5, 0, 0, 190.497),
	createObject(623, 103.9, -1745, 1.9, 0, 0, 110),
	createObject(1517, 124.4, -1831.1, 2.5, 0, 0, 0),
	createObject(621, 126.2998, -1784.2, 1.7, 0, 0, 190.492),
	createObject(1512, 124.7, -1831, 2.5, 0, 0, 0),
	createObject(1509, 125, -1830.8, 2.5, 0, 0, 0),
	createObject(1509, 124.9, -1830.6, 2.5, 0, 0, 0),
	createObject(1509, 124.8, -1830.4, 2.5, 0, 0, 0),
	createObject(1509, 125, -1830.5, 2.5, 0, 0, 0),
	createObject(1509, 125.1, -1830.7, 2.5, 0, 0, 0),
	createObject(1509, 124.9, -1830.4, 2.5, 0, 0, 0),
	createObject(623, 107.7998, -1749.8, 1.9, 0, 0, 109.99),
	createObject(1512, 124.6, -1830.8, 2.5, 0, 0, 0),
	createObject(621, 103.4004, -1769, 1.5, 0, 0, 190.492),
	createObject(1512, 124.5, -1830.6, 2.5, 0, 0, 0),
	createObject(1517, 124.3, -1830.9, 2.5, 0, 0, 0),
	createObject(1517, 124.2, -1830.7, 2.5, 0, 0, 0),
	createObject(623, 100.4004, -1738.2, 1.9, 0, 0, 109.99),
	createObject(1520, 125.6, -1830.3, 2.3, 0, 0, 0),
	createObject(1520, 125.5, -1830.1, 2.3, 0, 0, 0),
	createObject(1543, 126.2, -1830.3, 2.3, 0, 0, 0),
	createObject(1543, 126.1, -1830.1, 2.3, 0, 0, 0),
	createObject(1543, 126, -1829.9, 2.3, 0, 0, 0),
	createObject(1544, 125.9, -1830.4, 2.3, 0, 0, 0),
	createObject(1544, 125.8, -1830.2, 2.3, 0, 0, 0),
	createObject(1544, 125.7, -1830, 2.3, 0, 0, 0),
	createObject(1664, 125.4, -1830.6, 2.5, 0, 0, 0),
	createObject(1664, 125.3, -1830.4, 2.5, 0, 0, 0),
	createObject(1664, 125.2, -1830.2, 2.5, 0, 0, 0),
	createObject(8880, 154.7, -1957.9, 47.3, 30, 0, 180),
	createObject(8880, 151.5, -1957.4, 47, 29.998, 0, 156.495),
	createObject(5706, 130.7998, -1908.6, -1.9, 0, 0, 0.247),
	createObject(9361, 122.9902, -1915, 4.5, 0, 0, 134.995),
	createObject(3886, 116.2002, -1934, 0.1, 0, 0, 179.495),
	createObject(3886, 116.1, -1944.1, 0.1, 0, 0, 179.495),
	createObject(3886, 113.9, -1951.3, 0.1, 0, 0, 269.495),
	createObject(3886, 103.5, -1951.2, 0.1, 0, 0, 269.484),
	createObject(9362, 124.8, -1915.1, 2.9, 0, 0, 0),
	createObject(3886, 93.0299, -1951.1, 0.1, 0, 0, 269.484),
	createObject(3886, 82.57, -1951, 0.1, 0, 0, 269.484),
	createObject(3886, 115.9, -1958.6, 0.1, 0, 0, 179.495),
	createObject(2404, 127, -1913.1, 3.2, 0, 0, 182),
	createObject(3886, 115.8, -1969.06, 0.1, 0, 0, 179.495),
	createObject(3886, 115.7, -1979.54, 0.1, 0, 0, 359.495),
	createObject(2405, 126.2998, -1913.1, 3.2, 0, 0, 182),
	createObject(3886, 113.6, -1986.77, 0.1, 0, 0, 269.484),
	createObject(3886, 103.1, -1986.7, 0.1, 0, 0, 269.484),
	createObject(2406, 125.5996, -1913.1, 3.2, 0, 0, 182),
	createObject(3886, 92.66, -1986.6, 0.1, 0, 0, 269.484),
	createObject(3886, 109.011, -1921.6, 0.1, 0, 0, 269.484),
	createObject(3886, 98.5988, -1921.5, 0.1, 0, 0, 269.484),
	createObject(955, 127.7998, -1914, 2.3, 0, 0, 90),
	createObject(3886, 88.1199, -1921.41, 0.1, 0, 0, 269.484),
	createObject(2872, 127.7998, -1915.3, 1.9, 0, 0, 90),
	createObject(956, 127.7002, -1916.6, 2.3, 0, 0, 90),
	createObject(951, 131.5, -1917.8, 2.7, 0, 0, 0),
	createObject(951, 134.9, -1917.9, 2.7, 0, 0, 0),
	createObject(951, 138.6, -1917.8, 2.7, 0, 0, 0),
	createObject(951, 142.1, -1917.8, 2.7, 0, 0, 0),
	createObject(906, 112.4, -1894.4, 0, 0, 0, 0),
	createObject(906, 117.6, -1893.1, -0.5, 0, 0, 90),
	createObject(906, 142.3, -1882.4, -0.7, 0, 0, 0),
	createObject(906, 117.2, -1894.8, -0.1, 0, 0, 0),
	createObject(906, 145.3, -1881.7, -1.2, 0, 0, 90),
	createObject(1461, 108.4, -1919.9, 1.8, 0, 0, 0),
	createObject(1461, 97.5, -1919.69, 1.8, 0, 0, 0),
	createObject(900, 137.7002, -1890, -2.3, 0, 0, 0),
	createObject(1461, 105.4, -1949.4, 1.8, 0, 0, 0),
	createObject(1461, 91.6, -1949.2, 1.8, 0, 0, 0),
	createObject(1461, 94.2, -1984.8, 1.8, 0, 0, 0),
	createObject(1461, 105.1, -1984.8, 1.8, 0, 0, 0),
	createObject(1461, 117.9, -1932.3, 1.8, 0, 0, 270),
	createObject(632, 121.6, -1912.5, 2.3, 0, 0, 0),
	createObject(1461, 117.7, -1946, 1.8, 0, 0, 270),
	createObject(1461, 117.7, -1960.5, 1.8, 0, 0, 270),
	createObject(1461, 117.5, -1974, 1.8, 0, 0, 270),
	createObject(3334, 146.2, -1921.4, 3.1, 0, 0, 0),
	createObject(1461, 118.4, -1913.6, 2.7, 0, 0, 270),
	createObject(1637, 135.5, -1900, 3.19, 0, 0, 0),
	createObject(3860, 124.6, -1897.5, 3.1, 0, 0, 0),
	createObject(953, 123.7, -1898.7, 2.88, 0, 0, 0),
	createObject(1599, 127.2, -1898.5, 2.8, 0, 90, 88),
	createObject(902, 124.4, -1898, 2.7, 0, 0, 0),
	createObject(3860, 128.4, -1897.5, 3.1, 0, 0, 0),
	createObject(1599, 127.2, -1898.2, 2.8, 0, 90, 87.995),
	createObject(1599, 127.2, -1897.8, 2.8, 0, 90, 87.995),
	createObject(953, 123.7, -1898.2, 2.88, 0, 0, 0),
	createObject(953, 123.7, -1897.8, 2.88, 0, 0, 0),
	createObject(1600, 128, -1898.7, 2.828, 359.844, 98.999, 88.012),
	createObject(1600, 128, -1897.9, 2.828, 0, 96.25, 87.995),
	createObject(902, 124.4, -1898.5, 2.7, 0, 0, 0),
	createObject(1600, 128, -1898.3, 2.828, 0.4, 100.242, 90.709),
	createObject(902, 124, -1898, 2.7, 0, 0, 0),
	createObject(902, 124, -1898.5, 2.7, 0, 0, 0),
	createObject(1609, 125.1, -1898.6, 2.7999, 0, 0, 179.995),
	createObject(1609, 125.8, -1898.6, 2.7999, 0, 0, 179.995),
	createObject(1359, 122, -1896.2, 2.6, 0, 0, 0),
	createObject(1359, 130.6, -1896.3, 2.6, 0, 0, 0),
	createObject(3860, 119.1, -1897.4, 3.1, 0, 0, 0),
	createObject(1474, 116.5, -1919.25, 0.3, 0, 0, 0),
	createObject(1461, 118.6, -1898.4, 2.7, 270, 179.924, 268.674),
	createObject(1461, 118.6, -1897.8, 2.7, 270, 179.923, 269.67),
	createObject(1461, 119.3, -1897.8, 2.7, 270, 179.923, 269.67),
	createObject(1461, 119.3, -1898.4, 2.7, 270, 179.923, 269.67),
	createObject(1359, 116.9, -1896.2, 2.6, 0, 0, 0),
	createObject(970, 114.5, -1905.8, 2.5, 0, 0, 90),
	createObject(970, 114.5, -1901.7, 2.5, 0, 0, 90),
	createObject(970, 114.5, -1897.6, 2.5, 0, 0, 90),
	createObject(970, 114.5, -1909.9, 2.5, 0, 0, 90),
	createObject(970, 114.5, -1914, 2.5, 0, 0, 90),
	createObject(970, 114.5, -1916.2, 2.5, 0, 0, 90),
	createObject(970, 129.4, -1918.2, 2.5, 0, 0, 0.396),
	createObject(970, 133.5, -1918.19, 2.5, 0, 0, 0.396),
	createObject(970, 137.6, -1918.17, 2.5, 0, 0, 0.396),
	createObject(970, 145.33, -1918.15, 2.5, 0, 0, 0),
	createObject(970, 141.7, -1918.15, 2.5, 0, 0, 0.2),
	createObject(3250, 81.8, -1706.5, 2, 0, 0, 330),
	createObject(621, 82.7, -1697.2, 1.3, 0, 0, 190.492),
	createObject(621, 90.3, -1705.6, 0.69, 0, 0, 190.492),
	createObject(1432, 82, -1711.4, 2.6, 0, 0, 331.496),
	createObject(2837, 81.8, -1711.4, 3.23, 0, 0, 0),
	createObject(733, 107.8, -1720.3, 8.2, 0, 0, 0),
	createObject(621, 114.6, -1739.4, 6.5, 0, 0, 189.998),
	createObject(730, 128.9, -1764.7, 4.2, 0, 0, 0),
	createObject(1280, 131.6, -1771.4, 3.999, 5, 0, 40),
	createObject(878, 116.2, -1719.7, 8.6, 0, 0, 0),
	createObject(878, 124.5, -1733.9, 7.3, 0, 0, 0),
	createObject(1597, 131.8, -1756.4, 6.7, 358.001, 357.499, 154.162),
	createObject(17026, -27.2002, -1743, -18.1, 29.998, 0, 259.997),
	createObject(900, 83.8, -1908.7, -9.3, 68, 0, 15.25),
	createObject(3886, 82.2, -1986.5, 0.1, 0, 0, 269.484),
	createObject(900, 50.8, -1915.4, -7.2, 358.257, 354.998, 4.096),
	createObject(17026, -19.8, -1748, -9.6, 29.998, 0, 259.997),
}

-- LOD Objects
--------------->>

local lodObjects = {
	createObject(6437, 75, -1796.7, -3, 0, 0.445, 294, true),
}

-- LOD Object Association
-------------------------->>

setLowLODElement(mapObjects[1], lodObjects[1])

-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[1], true)
setElementDoubleSided(mapObjects[36], true)
setElementDoubleSided(mapObjects[38], true)
setElementDoubleSided(mapObjects[60], true)
setElementDoubleSided(mapObjects[67], true)
setElementDoubleSided(mapObjects[108], true)
setElementDoubleSided(mapObjects[118], true)
setElementDoubleSided(mapObjects[124], true)
setElementDoubleSided(mapObjects[136], true)
setElementDoubleSided(mapObjects[137], true)
setElementDoubleSided(mapObjects[139], true)
setElementDoubleSided(mapObjects[140], true)
setElementDoubleSided(mapObjects[141], true)
setElementDoubleSided(mapObjects[142], true)
setElementDoubleSided(mapObjects[143], true)
setElementDoubleSided(mapObjects[145], true)
setElementDoubleSided(mapObjects[146], true)
setElementDoubleSided(mapObjects[147], true)
setElementDoubleSided(mapObjects[148], true)
setElementDoubleSided(mapObjects[149], true)
setElementDoubleSided(mapObjects[150], true)
setElementDoubleSided(mapObjects[151], true)
setElementDoubleSided(mapObjects[152], true)
setElementDoubleSided(mapObjects[153], true)
setElementDoubleSided(mapObjects[154], true)
setElementDoubleSided(mapObjects[155], true)
setElementDoubleSided(mapObjects[156], true)
setElementDoubleSided(mapObjects[157], true)
setElementDoubleSided(mapObjects[158], true)
setElementDoubleSided(mapObjects[159], true)
setElementDoubleSided(mapObjects[160], true)
setElementDoubleSided(mapObjects[161], true)
setElementDoubleSided(mapObjects[162], true)
setElementDoubleSided(mapObjects[163], true)
setElementDoubleSided(mapObjects[164], true)
setElementDoubleSided(mapObjects[165], true)
setElementDoubleSided(mapObjects[173], true)
setElementDoubleSided(mapObjects[179], true)
setElementDoubleSided(mapObjects[183], true)
setElementDoubleSided(mapObjects[185], true)
setElementDoubleSided(mapObjects[186], true)
setElementDoubleSided(mapObjects[188], true)
setElementDoubleSided(mapObjects[190], true)
setElementDoubleSided(mapObjects[191], true)
setElementDoubleSided(mapObjects[192], true)
setElementDoubleSided(mapObjects[195], true)
setElementDoubleSided(mapObjects[196], true)
setElementDoubleSided(mapObjects[198], true)
setElementDoubleSided(mapObjects[205], true)
setElementDoubleSided(mapObjects[207], true)
setElementDoubleSided(mapObjects[208], true)
setElementDoubleSided(mapObjects[209], true)
setElementDoubleSided(mapObjects[210], true)
setElementDoubleSided(mapObjects[212], true)
setElementDoubleSided(mapObjects[213], true)
setElementDoubleSided(mapObjects[214], true)
setElementDoubleSided(mapObjects[215], true)
setElementDoubleSided(mapObjects[216], true)
setElementDoubleSided(mapObjects[217], true)
setElementDoubleSided(mapObjects[218], true)
setElementDoubleSided(mapObjects[219], true)
setElementDoubleSided(mapObjects[220], true)
setElementDoubleSided(mapObjects[221], true)
setElementDoubleSided(mapObjects[222], true)
setElementDoubleSided(mapObjects[227], true)
setElementDoubleSided(mapObjects[228], true)
setElementDoubleSided(mapObjects[232], true)
setElementDoubleSided(mapObjects[233], true)
setElementDoubleSided(mapObjects[234], true)
setElementDoubleSided(mapObjects[236], true)
setElementDoubleSided(mapObjects[237], true)
setElementDoubleSided(mapObjects[238], true)

-- Object Scale
---------------->>

setObjectScale(mapObjects[187], 0.5)
setObjectScale(mapObjects[189], 0.2)
setObjectScale(mapObjects[193], 0.5)
setObjectScale(mapObjects[194], 0.5)
setObjectScale(mapObjects[197], 0.2)
setObjectScale(mapObjects[199], 0.2)
setObjectScale(mapObjects[200], 0.2)
setObjectScale(mapObjects[201], 0.2)
setObjectScale(mapObjects[202], 0.2)
setObjectScale(mapObjects[232], 0.5)
setObjectScale(mapObjects[233], 0.5)

-- Remove World Objects
------------------------>>

removeWorldModel(726, 20.9216, 112.5859, -1720.672, 8.0781)