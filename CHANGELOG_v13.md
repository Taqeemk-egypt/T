# Taqeemk v13 - Changelog

## تحديثات النسخة 13 (January 2025)

### 🎨 نظام الأيقونات الموحد

#### 1. خريطة الأيقونات المركزية (PLATFORM_ICONS)
- ✅ تم إضافة `PLATFORM_ICONS` constant في `app.js` كمصدر واحد لجميع مسارات أيقونات PNG
- ✅ جميع المنصات (facebook, instagram, whatsapp, snapchat, linkedin, gmail, tiktok, map, review) تستخدم `icons/*.png`
- ✅ دمج 'تقييمات' و'تقييم' في entry واحد (`review` و `reviews` يشيران لنفس الملف)

#### 2. تحديث Icons.renderBadge()
- ✅ الدالة تتحقق أولاً من `PLATFORM_ICONS` لاستخدام PNG
- ✅ مواصفات جديدة للأيقونات:
  - **مربع الأيقونة**: 44×44px، border-radius: 12px
  - **الخلفية**: `rgba(255,255,255,.06)` موحدة لجميع المنصات
  - **الحدود**: `border: 1px solid rgba(255,255,255,.1)`
  - **الصورة**: 30×30px، `object-fit: contain`
  - **فلاتر**: `filter: none !important; opacity: 1 !important; mix-blend-mode: normal !important`
- ✅ إزالة المربعات الملونة المصمتة والـ gradients
- ✅ Fallback لـ SVG/Font Awesome للأيقونات التي ليس لها PNG (X, YouTube, etc.)

#### 3. تحديث renderSocialIconsHtml() في dashboard.html
- ✅ شريط الأيقونات الاجتماعية:
  - **حجم الدائرة**: 44×44px (border-radius: 50%)
  - **الخلفية**: `rgba(255,255,255,.06)` موحدة
  - **الحدود**: `border: 1px solid rgba(255,255,255,.1)`
  - **حجم الأيقونة**: 26×26px
- ✅ إزالة `borderColor` و `glowColor` و `box-shadow` الملونة
- ✅ إزالة استخدام `cardBg` و `cardBorder` من theme

#### 4. تحديث renderSocials() في p.html
- ✅ نفس المواصفات الموحدة كـ dashboard.html
- ✅ خلفية شفافة موحدة لجميع المنصات
- ✅ الأيقونات بألوانها الأصلية بدون تأثيرات color filters

### 🐛 إصلاحات الباجات

#### 1. مشكلة ظهور أيقونة Instagram في غلاف الصفحة (Portrait Mode)
- ✅ **السبب**: كان الكود يستخدم `const bgUrl = coverUrl || avatarUrl || ''` مما يعني استخدام صورة الأفاتار كخلفية إذا لم يكن هناك غلاف
- ✅ **الحل**: إزالة `avatarUrl` من fallback chain في كل من:
  - `p.html` - loadPublicSystem() function (line ~200)
  - `dashboard.html` - refreshPhonePreview() function (line ~1970)
- ✅ الآن يستخدم فقط `coverUrl` أو gradient افتراضي

#### 2. مشكلة رابط Facebook "hthttps://"
- ✅ **السبب**: `Security.cleanUrl()` كان يضيف بروتوكول حتى لو كان موجود بالفعل
- ✅ **الحل**: إضافة فحص في بداية الدالة:
  ```javascript
  // If URL already starts with valid protocol, return as-is
  if (/^https?:\/\//i.test(str)) {
    return str;
  }
  ```
- ✅ يمنع تكرار البروتوكول للروابط الصحيحة

### 📝 تحديثات LINK_TYPES

- ✅ دمج 'reviews' و 'review' في نوع واحد فقط (`review`)
- ✅ تحديث `bgStyle` لجميع الأنواع (ماعدا X و YouTube):
  ```javascript
  bgStyle: 'background: rgba(255,255,255,.06); border: 1px solid rgba(255,255,255,.1);'
  ```
- ✅ المنصات التالية تستخدم الخلفية الموحدة:
  - Instagram, Facebook, WhatsApp, TikTok, Email/Gmail
  - Snapchat, LinkedIn, Map, Review

### 🗂️ ملفات الأيقونات المطلوبة

#### icons/ folder structure:
```
icons/
├── README.md (تم إنشاؤه)
├── facebook.png (يجب حفظه يدوياً)
├── instagram.png (يجب حفظه يدوياً)
├── whatsapp.png (يجب حفظه يدوياً)
├── snapchat.png (يجب حفظه يدوياً)
├── linkedin.png (يجب حفظه يدوياً)
├── gmail.png (يجب حفظه يدوياً)
├── tiktok.png (يجب حفظه يدوياً)
├── map.png (يجب حفظه يدوياً)
└── review.png (يجب حفظه يدوياً)
```

**⚠️ مهم**: لا يمكن حفظ ملفات PNG binary من خلال الكود - يجب على المستخدم حفظها يدوياً!

### 🔢 تحديثات النسخ (Cache Busting)

- ✅ `style.css?v=12` → `?v=13`
- ✅ `app.js?v=12` → `?v=13`
- ✅ `theme.js?v=12` → `?v=13`
- ✅ تم التحديث في كل من `dashboard.html` و `p.html`

### 📄 الملفات المعدلة

1. **app.js**
   - إضافة `PLATFORM_ICONS` constant
   - تحديث `Icons.renderBadge()` لاستخدام PNG مع fallback
   - إضافة `PLATFORM_ICONS` إلى Icons object export
   - تحديث `LINK_TYPES` bgStyle
   - تحديث `Security.cleanUrl()` لمنع تكرار البروتوكول

2. **dashboard.html**
   - تحديث `renderSocialIconsHtml()` لاستخدام الخلفية الموحدة
   - إصلاح `refreshPhonePreview()` portrait mode (إزالة avatarUrl fallback)
   - تحديث روابط CSS/JS إلى v=13

3. **p.html**
   - تحديث `renderSocials()` لاستخدام الخلفية الموحدة
   - إصلاح portrait layout (إزالة avatarUrl من bgUrl)
   - تحديث روابط CSS/JS إلى v=13

4. **icons/README.md** (جديد)
   - دليل كامل لملفات الأيقونات المطلوبة
   - المواصفات والاستخدام

5. **CHANGELOG_v13.md** (جديد)
   - هذا الملف - توثيق شامل لجميع التغييرات

### ✅ الحالة النهائية

#### تم التنفيذ:
- [x] إضافة PLATFORM_ICONS map في app.js
- [x] تحديث Icons.renderBadge() لاستخدام PNG icons
- [x] استبدال المربعات الملونة بخلفية rgba موحدة
- [x] دمج 'تقييمات' و'تقييم' في نوع واحد
- [x] إصلاح ظهور أيقونة Instagram في غلاف الصفحة
- [x] إصلاح رابط Facebook "hthttps://"
- [x] تحديث النسخ إلى v=13
- [x] إنشاء icons/README.md

#### معلق (يتطلب تدخل المستخدم):
- [ ] حفظ 9 ملفات PNG يدوياً في `icons/` folder:
  - facebook.png
  - instagram.png
  - whatsapp.png
  - snapchat.png
  - linkedin.png
  - gmail.png
  - tiktok.png
  - map.png
  - review.png

### 🎯 الخطوات التالية

1. احفظ الأيقونات التسعة كملفات PNG في `e:\teq\icons\`
2. تأكد من أن أسماء الملفات مطابقة تماماً (lowercase)
3. افتح dashboard.html في المتصفح واختبر:
   - معاينة الأيقونات في لوحة التحكم
   - شريط الأيقونات الاجتماعية
   - أزرار الروابط
4. افتح p.html وتحقق من:
   - عرض الأيقونات بألوانها الأصلية
   - عدم ظهور أيقونة في الغلاف بوضع Portrait
   - روابط Facebook صحيحة بدون "hthttps"

### 📊 الأداء والتوافقية

- **حجم الأيقونات**: PNG icons أصغر من SVG data URIs المضمنة
- **التخزين المؤقت**: روابط v=13 تضمن تحميل الإصدار الجديد
- **Fallback**: SVG icons تعمل إذا كانت PNG غير متوفرة
- **التوافق**: يعمل على جميع المتصفحات الحديثة
- **الأداء**: تحميل واحد للأيقونة يُعاد استخدامه في جميع الأماكن

---

**تاريخ التحديث**: يناير 2025  
**النسخة**: v13  
**المطور**: Taqeemk Team
