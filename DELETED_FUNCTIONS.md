# قائمة الدوال والعناصر المحذوفة - مركز أكواد QR

## ✅ تم حذف القسم القديم بالكامل

### JavaScript Functions (10 دوال محذوفة من dashboard.html)

1. ❌ `populateGlobalQRSystemFilter(preserveVal)`
2. ❌ `applyGlobalQRFilters()`
3. ❌ `formatQRDate(dateStr)`
4. ❌ `renderGlobalQRTable(qrs)`
5. ❌ `previewGlobalQR(qrId)`
6. ❌ `closeQRPreviewModal()`
7. ❌ `downloadGlobalQRPNG(qrId)`
8. ❌ `downloadGlobalQRSVG(qrId)`
9. ❌ `confirmDeleteGlobalQR(qrId)`
10. ❌ `deleteQRItem(qrId)`

---

### HTML Elements (محذوفة من dashboard.html)

1. ❌ `<section id="static-profiles-qr-section">` - قسم كروت QR الثابتة
2. ❌ `<select id="global-qr-system-filter">` - فلتر الأنظمة
3. ❌ `<select id="global-qr-sort-select">` - ترتيب الأكواد
4. ❌ `<input id="global-qr-search-input">` - بحث سريع
5. ❌ `<div class="qr-scroll-indicator">` - مؤشر التمرير
6. ❌ `<div id="qr-table-wrapper">` - wrapper الجدول القديم
7. ❌ `<tbody id="global-qr-tbody">` - body الجدول
8. ❌ `<div id="global-qr-empty-state">` - رسالة فارغة قديمة

---

### CSS Classes (محذوفة من style.css)

1. ❌ `.qr-table-wrapper`
2. ❌ `.qr-table`
3. ❌ `.qr-table th`, `.qr-table td`
4. ❌ `.qr-sticky-col-num`
5. ❌ `.qr-sticky-col-title`
6. ❌ `.qr-sticky-col-actions`
7. ❌ `.qr-scroll-indicator`
8. ❌ `.qr-action-btn`

---

## ✅ التحقق

تم البحث في:
- ✅ app.js - لا توجد استخدامات
- ✅ p.html - لا توجد استخدامات
- ✅ r.html - لا توجد استخدامات
- ✅ dashboard.html - تم الحذف الكامل

**النتيجة:** لا يوجد كود ميت (dead code) متبقي ✅

---

## 📊 الإحصائيات

- **عدد الدوال المحذوفة:** 10
- **عدد العناصر HTML المحذوفة:** 8+
- **عدد كلاسات CSS المحذوفة:** 8
- **إجمالي الأسطر المحذوفة:** ~320 سطر

---

## 🔄 البديل الجديد

جميع هذه الوظائف تم إعادة تطبيقها في:
- `openGlobalQRHub()` / `closeGlobalQRHub()`
- `loadAllQRCodes()` / `updateStats()` / `renderQRList()`
- `applyQRFilters()` (اسم جديد مختلف)
- `previewQR()` / `downloadQRFile()` / `deleteQR()`
- `openCreateQRModal()` / `openEditQRModal()` / `handleQRSubmit()`

**التصميم الجديد:** صفوف responsive بدلاً من جدول أفقي + Live preview + Account gating ✨
