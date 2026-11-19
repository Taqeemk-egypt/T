-- ==============================================================================
-- TAQEEMK MIGRATION V3: Fix Row Level Security (RLS) for QR Codes SELECT
-- SAFE ADDITIVE MIGRATION — DOES NOT DROP OR OVERWRITE EXISTING POLICIES
-- ==============================================================================

-- 1. التأكد من تفعيل RLS على جدول qr_codes
ALTER TABLE IF EXISTS public.qr_codes ENABLE ROW LEVEL SECURITY;

-- 2. منح صلاحية القراءة (SELECT) للأدوار authenticated و anon على الجدول
GRANT SELECT ON public.qr_codes TO authenticated, anon;

-- 3. إضافة سياسة SELECT مخصصة للمستخدمين المسجلين لقراءة كافة أكوادهم الخاصة
-- ملاحظة هامة في PostgreSQL RLS:
-- عند وجود أكثر من سياسة SELECT على نفس الجدول، يتم دمجها تلقائياً بمنطق (OR).
-- هذه السياسة تضمن بنسبة 100% أن المستخدم المسجل (auth.uid()) يمكنه استرجاع
-- وعرض جميع أكواد الـ QR التي يملكها (user_id = auth.uid()) بغض النظر عن:
-- - حالة التفعيل (is_active سواء كانت true أو false)
-- - الملف المرتبط (system_id)
-- - أو أي قيود أخرى في السياسات العامة.
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'qr_codes' 
        AND policyname = 'Users can view their own QR codes'
    ) THEN
        CREATE POLICY "Users can view their own QR codes" 
        ON public.qr_codes 
        FOR SELECT 
        TO authenticated 
        USING (auth.uid() = user_id);
    END IF;
END $$;

-- 4. سياسة إضافية لتمكين الأدمن من قراءة كافة الأكواد لجميع المستخدمين (اختياري وآمن)
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'qr_codes' 
        AND policyname = 'Admins can view all QR codes'
    ) THEN
        CREATE POLICY "Admins can view all QR codes" 
        ON public.qr_codes 
        FOR SELECT 
        TO authenticated 
        USING (
            EXISTS (
                SELECT 1 FROM public.profiles 
                WHERE profiles.id = auth.uid() 
                AND profiles.is_admin = TRUE
            )
        );
    END IF;
END $$;
