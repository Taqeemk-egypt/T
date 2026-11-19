# Icons Folder - Social Media Platform Icons

This folder contains PNG icon files for all social media platforms used in Taqeemk.

## Required Icon Files

Please save the following PNG images in this folder:

1. **facebook.png** - Facebook icon (colored)
2. **instagram.png** - Instagram icon (colored gradient)
3. **whatsapp.png** - WhatsApp icon (green)
4. **snapchat.png** - Snapchat icon (yellow ghost)
5. **linkedin.png** - LinkedIn icon (blue)
6. **gmail.png** - Gmail/Email icon (colored)
7. **tiktok.png** - TikTok icon (black/pink)
8. **map.png** - Google Maps pin icon (colored)
9. **review.png** - Google Reviews/Star icon (colored)

## Icon Specifications

- **Format**: PNG with transparent background
- **Recommended size**: 512×512px or 256×256px
- **Display size**: Icons will be displayed at 30×30px inside 44×44px containers
- **Colors**: Use full brand colors (not monochrome)
- **Quality**: Use official brand assets when possible

## Usage

Icons are referenced in `app.js` via the `PLATFORM_ICONS` constant:

```javascript
const PLATFORM_ICONS = {
  facebook: 'icons/facebook.png',
  instagram: 'icons/instagram.png',
  whatsapp: 'icons/whatsapp.png',
  snapchat: 'icons/snapchat.png',
  linkedin: 'icons/linkedin.png',
  gmail: 'icons/gmail.png',
  email: 'icons/gmail.png',
  tiktok: 'icons/tiktok.png',
  map: 'icons/map.png',
  review: 'icons/review.png',
  reviews: 'icons/review.png'
};
```

## Note

If any icon file is missing, the system will fall back to the SVG/FontAwesome icons defined in the `SVGS` object in `app.js`. However, for best visual results, all PNG files should be present.

---

**Last Updated**: v13 - January 2025
