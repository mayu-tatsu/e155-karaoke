# 0 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\lib\\arm_math\\dsp\\TransformFunctions\\arm_cfft_radix2_q31.c"
# 1 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\lib\\arm_math\\dsp\\TransformFunctions\\arm_cfft_radix2_q31.c"
# 29 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\lib\\arm_math\\dsp\\TransformFunctions\\arm_cfft_radix2_q31.c"
# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h" 1
# 30 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h" 1
# 44 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"
# 82 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h"
# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_compiler.h" 1
# 28 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_compiler.h"
# 1 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h" 1 3 4
# 20 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h" 3 4
# 1 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL.h" 1 3 4
# 17 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL.h" 3 4
# 1 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_ConfDefaults.h" 1 3 4
# 67 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_ConfDefaults.h" 3 4
# 1 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Conf.h" 1 3 4
# 35 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Conf.h" 3 4
# 1 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h" 1 3 4
# 539 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h" 3 4
  
# 539 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h" 3 4
 static __inline__ __attribute__((__always_inline__)) int __SEGGER_RTL_CLZ_U32_safe_inline(unsigned x) {
    return x == 0 ? 32 : __builtin_clz(x);
  }
# 748 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h" 3 4
static __inline__ __attribute__((__always_inline__)) void __SEGGER_RTL_WR_PARTIAL_WORD_func(char *addr, unsigned w, int n) {
  switch (n) {
  default: addr[3] = (-1) > 0 ? w : w >> 24;
  case 3: addr[2] = (-1) > 0 ? w >> 8 : w >> 16;
  case 2: addr[1] = (-1) > 0 ? w >> 16 : w >> 8;
  case 1: addr[0] = (-1) > 0 ? w >> 24 : w;
  case 0: ;
  }
}

static __inline__ __attribute__((__always_inline__)) void __SEGGER_RTL_WR_WORD_func(char *addr, unsigned w) {
  __SEGGER_RTL_WR_PARTIAL_WORD_func(addr, w, 4);
}

static __inline__ __attribute__((__always_inline__)) unsigned __SEGGER_RTL_RD_WORD_func(const void *addr) {
  const unsigned char *pAddr = (const unsigned char *)addr;

  return pAddr[0] * ((-1) > 0 ? 0x1000000u : 0x1u) +
         pAddr[1] * ((-1) > 0 ? 0x10000u : 0x100u) +
         pAddr[2] * ((-1) > 0 ? 0x100u : 0x10000u) +
         pAddr[3] * ((-1) > 0 ? 0x1u : 0x1000000u);
}

static __inline__ __attribute__((__always_inline__)) unsigned __SEGGER_RTL_BYTE_PATTERN_func(unsigned x) {
  return x * 0x01010101uL;
}

static __inline__ __attribute__((__always_inline__)) unsigned __SEGGER_RTL_FILL_HEAD_func(const void *pOrigin, unsigned Word, unsigned Standin) {
  unsigned Mask;
  unsigned Fill;

  (void)pOrigin;

  Fill = __SEGGER_RTL_BYTE_PATTERN_func(Standin);
# 792 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h" 3 4
  Mask = 0xFFFFFFFFu;
  Mask <<= 8 * 0;

  return (Word & Mask) | (Fill & ~Mask);


}

static __inline__ __attribute__((__always_inline__)) unsigned __SEGGER_RTL_FILL_TAIL_func(unsigned n, unsigned Word, unsigned Standin) {
  unsigned Mask;
  unsigned Fill;
# 817 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h" 3 4
  if (n >= 4) {
    return Word;
  } else {
    Fill = __SEGGER_RTL_BYTE_PATTERN_func(Standin);
    Mask = 0xFFFFFFFFu << (8 * n);

    return (Fill & Mask) | (Word & ~Mask);
  }


}

static __inline__ __attribute__((__always_inline__)) unsigned __SEGGER_RTL_ZBYTE_CHECK_func(unsigned x) {



  return __builtin_arm_uqsub8(0x01010101, x);






}

static __inline__ __attribute__((__always_inline__)) unsigned __SEGGER_RTL_DIFF_INDEX_func(unsigned x, unsigned y) {



  return __SEGGER_RTL_CLZ_U32_safe_inline(__builtin_arm_rbit(x^y)) / 8;
# 873 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h" 3 4
}

static __inline__ __attribute__((__always_inline__)) unsigned __SEGGER_RTL_DIFF_BYTE_func(unsigned x, int Index) {



  return (x >> (8*Index)) & 0xFF;

}

static __inline__ __attribute__((__always_inline__)) unsigned __SEGGER_RTL_ZBYTE_INDEX_func(unsigned x) {







  return __SEGGER_RTL_CLZ_U32_safe_inline(__builtin_arm_rbit(__SEGGER_RTL_ZBYTE_CHECK_func(x))) / 8;
# 926 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h" 3 4
}

static __inline__ __attribute__((__always_inline__)) _Bool __SEGGER_RTL_atomic_is_lock_free(unsigned size, const volatile void *ptr) {
  switch (size) {
  case 1: return 1;
  case 2: return ((unsigned)ptr & 1) == 0;
  case 4: return ((unsigned)ptr & 3) == 0;
  default: return 0;
  }
}
# 946 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h" 3 4
extern const int __aeabi_SIGABRT;
extern const int __aeabi_SIGINT;
extern const int __aeabi_SIGILL;
extern const int __aeabi_SIGFPE;
extern const int __aeabi_SIGSEGV;
extern const int __aeabi_SIGTERM;

void __aeabi_SIG_DFL(int sig);
void __aeabi_SIG_IGN(int sig);
void __aeabi_SIG_ERR(int sig);
# 36 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Conf.h" 2 3 4
# 68 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_ConfDefaults.h" 2 3 4
# 18 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL.h" 2 3 4
# 38 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL.h" 3 4
  typedef struct __SEGGER_RTL_FILE_impl __SEGGER_RTL_FILE;


typedef struct __SEGGER_RTL_locale_data_s __SEGGER_RTL_locale_t;
typedef struct __SEGGER_RTL_locale_codeset_s __SEGGER_RTL_locale_codeset_t;

typedef struct {



  const char * decimal_point;
  const char * thousands_sep;
  const char * grouping;

  const char * int_curr_symbol;
  const char * currency_symbol;
  const char * mon_decimal_point;
  const char * mon_thousands_sep;
  const char * mon_grouping;
  const char * positive_sign;
  const char * negative_sign;

  char int_frac_digits;
  char frac_digits;
  char p_cs_precedes;
  char p_sep_by_space;
  char n_cs_precedes;
  char n_sep_by_space;
  char p_sign_posn;
  char n_sign_posn;
  char int_p_cs_precedes;
  char int_n_cs_precedes;
  char int_p_sep_by_space;
  char int_n_sep_by_space;
  char int_p_sign_posn;
  char int_n_sign_posn;




  const char *day_names;
  const char *abbrev_day_names;
  const char *month_names;
  const char *abbrev_month_names;
  const char *am_pm_indicator;
  const char *date_format;
  const char *time_format;
  const char *date_time_format;
} __SEGGER_RTL_locale_data_t;

struct __SEGGER_RTL_locale_data_s {
  const char * name;
  const __SEGGER_RTL_locale_data_t * data;
  const __SEGGER_RTL_locale_codeset_t * codeset;
};

struct __SEGGER_RTL_POSIX_locale_s {
  const __SEGGER_RTL_locale_t *__category[5];
};

struct timeval;
# 107 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL.h" 3 4
extern struct __SEGGER_RTL_POSIX_locale_s __SEGGER_RTL_global_locale;
extern struct __SEGGER_RTL_POSIX_locale_s * __SEGGER_RTL_locale_ptr;
extern char * __SEGGER_RTL_locale_name_buffer;
# 118 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL.h" 3 4
extern const __SEGGER_RTL_locale_t __SEGGER_RTL_c_locale;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_1;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_2;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_3;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_4;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_5;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_6;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_7;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_8;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_9;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_10;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_11;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_13;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_14;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_15;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_iso8859_16;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_cp1250;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_cp1251;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_cp1252;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_cp1253;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_cp1254;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_cp1255;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_cp1256;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_cp1257;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_cp1258;

extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_c_locale_data;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_aa_DJ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_aa_ER_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_aa_ET_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_af_NA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_af_ZA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ak_GH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_am_ET_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_AE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_BH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_DZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_EG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_IQ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_JO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_KW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_LB_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_LY_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_MA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_OM_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_QA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_SA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_SD_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_SY_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_TN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ar_YE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_as_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_asa_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_az_Arab_IR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_az_AZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_az_Cyrl_AZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_az_IR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_az_Latn_AZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_be_BY_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_bem_ZM_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_bez_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_bg_BG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_bm_ML_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_bn_BD_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_bn_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_bo_CN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_bo_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_br_FR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_brx_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_bs_BA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_byn_ER_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ca_ES_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_cch_NG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_cgg_UG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_chr_US_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_cs_CZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_cy_GB_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_da_DK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_dav_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_de_AT_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_de_BE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_de_CH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_de_DE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_de_LI_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_de_LU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_dv_MV_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_dz_BT_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ebu_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ee_GH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ee_TG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_el_CY_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_el_GR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_AS_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_AU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_BE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_BW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_BZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_CA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_Dsrt_US_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_GB_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_GU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_HK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_IE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_JM_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_MH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_MP_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_MT_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_MU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_NA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_NZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_PH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_PK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_SG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_TT_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_UM_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_US_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_US_POSIX_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_VI_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_ZA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_ZW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_en_ZZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_AR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_BO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_CL_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_CO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_CR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_DO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_EC_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_ES_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_GQ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_GT_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_HN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_MX_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_NI_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_PA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_PE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_PR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_PY_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_SV_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_US_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_UY_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_es_VE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_et_EE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_eu_ES_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fa_AF_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fa_IR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ff_SN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fi_FI_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fil_PH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fo_FO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_BE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_BF_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_BI_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_BJ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_BL_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_CA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_CD_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_CF_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_CG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_CH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_CI_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_CM_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_DJ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_FR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_GA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_GN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_GP_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_GQ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_KM_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_LU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_MC_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_MF_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_MG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_ML_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_MQ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_NE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_RE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_RW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_SN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_TD_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fr_TG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_fur_IT_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ga_IE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_gaa_GH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_gez_ER_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_gez_ET_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_gl_ES_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_gsw_CH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_gu_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_guz_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_gv_GB_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ha_Arab_NG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ha_Arab_SD_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ha_GH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ha_Latn_GH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ha_Latn_NE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ha_Latn_NG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ha_NE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ha_NG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ha_SD_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_haw_US_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_he_IL_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_hi_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_hr_HR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_hu_HU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_hy_AM_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_id_ID_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ig_NG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ii_CN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_is_IS_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_it_CH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_it_IT_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ja_JP_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_jmc_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ka_GE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kab_DZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kaj_NG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kam_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kcg_NG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kde_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kea_CV_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kfo_CI_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_khq_ML_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ki_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kk_Cyrl_KZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kk_KZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kl_GL_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kln_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_km_KH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kn_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ko_KR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kok_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kpe_GN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kpe_LR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ksb_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ksh_DE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ku_Arab_IQ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ku_Arab_IR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ku_IQ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ku_IR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ku_Latn_SY_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ku_Latn_TR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ku_SY_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ku_TR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_kw_GB_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ky_KG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_lag_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_lg_UG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ln_CD_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ln_CG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_lo_LA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_lt_LT_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_luo_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_luy_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_lv_LV_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mas_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mas_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mer_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mfe_MU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mg_MG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mi_NZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mk_MK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ml_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mn_CN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mn_Cyrl_MN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mn_MN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mn_Mong_CN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mr_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ms_BN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ms_MY_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_mt_MT_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_my_MM_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_naq_NA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_nb_NO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_nd_ZW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_nds_DE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ne_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ne_NP_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_nl_BE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_nl_NL_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_nn_NO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_nr_ZA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_nso_ZA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ny_MW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_nyn_UG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_oc_FR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_om_ET_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_om_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_or_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_pa_Arab_PK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_pa_Guru_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_pa_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_pa_PK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_pl_PL_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ps_AF_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_pt_AO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_pt_BR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_pt_GW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_pt_MZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_pt_PT_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_rm_CH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ro_MD_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ro_RO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_rof_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ru_MD_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ru_RU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ru_UA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_rw_RW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_rwk_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sa_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_saq_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_se_FI_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_se_NO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_seh_MZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ses_ML_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sg_CF_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sh_BA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sh_CS_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sh_YU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_shi_Latn_MA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_shi_MA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_shi_Tfng_MA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_si_LK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sid_ET_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sk_SK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sl_SI_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sn_ZW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_so_DJ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_so_ET_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_so_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_so_SO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sq_AL_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_BA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_CS_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_Cyrl_BA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_Cyrl_CS_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_Cyrl_ME_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_Cyrl_RS_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_Cyrl_YU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_Latn_BA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_Latn_CS_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_Latn_ME_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_Latn_RS_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_Latn_YU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_ME_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_RS_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sr_YU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ss_SZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ss_ZA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ssy_ER_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_st_LS_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_st_ZA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sv_FI_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sv_SE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sw_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_sw_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_syr_SY_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ta_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ta_LK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_te_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_teo_KE_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_teo_UG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_tg_Cyrl_TJ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_tg_TJ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_th_TH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ti_ER_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ti_ET_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_tig_ER_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_tl_PH_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_tn_ZA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_to_TO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_tr_TR_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_trv_TW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ts_ZA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_tt_RU_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_tzm_Latn_MA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_tzm_MA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ug_Arab_CN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ug_CN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_uk_UA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ur_IN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ur_PK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_uz_AF_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_uz_Arab_AF_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_uz_Cyrl_UZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_uz_Latn_UZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_uz_UZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_ve_ZA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_vi_VN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_vun_TZ_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_wal_ET_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_wo_Latn_SN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_wo_SN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_xh_ZA_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_xog_UG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_yo_NG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_CN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_Hans_CN_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_Hans_HK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_Hans_MO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_Hans_SG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_Hant_HK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_Hant_MO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_Hant_TW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_HK_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_MO_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_SG_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zh_TW_locale;
extern const __SEGGER_RTL_locale_data_t __SEGGER_RTL_zu_ZA_locale;

extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_ascii;
extern const __SEGGER_RTL_locale_codeset_t __SEGGER_RTL_codeset_utf8;

extern const char __SEGGER_RTL_data_utf8_period [];
extern const char __SEGGER_RTL_data_utf8_comma [];
extern const char __SEGGER_RTL_data_utf8_space [];
extern const char __SEGGER_RTL_data_utf8_plus [];
extern const char __SEGGER_RTL_data_utf8_minus [];
extern const char __SEGGER_RTL_data_empty_string[];
# 546 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL.h" 3 4
int __SEGGER_RTL_X_set_time_of_day (const struct timeval *__tp);
int __SEGGER_RTL_X_get_time_of_day (struct timeval *__tp);
const __SEGGER_RTL_locale_t * __SEGGER_RTL_X_find_locale (const char *__locale);
__SEGGER_RTL_FILE * __SEGGER_RTL_X_file_open (const char *__filename, const char *__mode);
__SEGGER_RTL_FILE * __SEGGER_RTL_X_file_dopen (int __descriptor, const char *__mode);
int __SEGGER_RTL_X_file_stat (__SEGGER_RTL_FILE *__stream);
int __SEGGER_RTL_X_file_read (__SEGGER_RTL_FILE *__stream, char *__s, unsigned __len);
int __SEGGER_RTL_X_file_write (__SEGGER_RTL_FILE *__stream, const char *__s, unsigned __len);
int __SEGGER_RTL_X_file_unget (__SEGGER_RTL_FILE *__stream, int __c);
int __SEGGER_RTL_X_file_close (__SEGGER_RTL_FILE *__stream);
int __SEGGER_RTL_X_file_error (__SEGGER_RTL_FILE *__stream);
int __SEGGER_RTL_X_file_flush (__SEGGER_RTL_FILE *__stream);
int __SEGGER_RTL_X_file_eof (__SEGGER_RTL_FILE *__stream);
void __SEGGER_RTL_X_file_clrerr (__SEGGER_RTL_FILE *__stream);
int __SEGGER_RTL_X_file_seek (__SEGGER_RTL_FILE *__stream, long __offset, int __whence);
int __SEGGER_RTL_X_file_getpos (__SEGGER_RTL_FILE *__stream, long *__pos);
int __SEGGER_RTL_X_file_bufsize (__SEGGER_RTL_FILE *__stream);
__SEGGER_RTL_FILE * __SEGGER_RTL_X_file_tmpfile (void);
char * __SEGGER_RTL_X_file_tmpnam (char *__s, unsigned __max);
int __SEGGER_RTL_X_file_remove (const char *__filename);
int __SEGGER_RTL_X_file_rename (const char *__old, const char *__new);
void __attribute__((__weak__)) __SEGGER_RTL_X_heap_lock (void);
void __attribute__((__weak__)) __SEGGER_RTL_X_heap_unlock (void);
int __attribute__((__weak__)) __SEGGER_RTL_X_atomic_lock (void);
void __attribute__((__weak__)) __SEGGER_RTL_X_atomic_unlock (int __state);
int __attribute__((__weak__)) __SEGGER_RTL_X_atomic_is_lock_free (unsigned int __size, void *__ptr);
void __attribute__((__weak__)) __SEGGER_RTL_X_atomic_synchronize (void);
volatile int * __aeabi_errno_addr (void);
void __aeabi_assert (const char *__expression, const char *__filename, int __line);
# 584 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL.h" 3 4
void __SEGGER_RTL_execute_at_exit_fns (void);
void __SEGGER_RTL_set_locale_name_buffer (char *__buffer);
int __SEGGER_RTL_mb_max (const struct __SEGGER_RTL_POSIX_locale_s *__loc);
int __SEGGER_RTL_mb_cur_max (void);
void __SEGGER_RTL_init_heap (void *__ptr, unsigned int __size);
# 21 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h" 2 3 4
# 272 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h" 3 4
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int int16_t;
typedef short unsigned int uint16_t;
typedef long int int32_t;
typedef long unsigned int uint32_t;
typedef long long int int64_t;
typedef long long unsigned int uint64_t;

typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef long int int_least32_t;
typedef long long int int_least64_t;
typedef unsigned char uint_least8_t;
typedef short unsigned int uint_least16_t;
typedef long unsigned int uint_least32_t;
typedef long long unsigned int uint_least64_t;

typedef int int_fast8_t;
typedef int int_fast16_t;
typedef int int_fast32_t;
typedef long long int int_fast64_t;
typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef long long unsigned int uint_fast64_t;

typedef int intptr_t;
typedef unsigned int uintptr_t;

typedef long long int intmax_t;
typedef long long unsigned int uintmax_t;
# 29 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_compiler.h" 2
# 54 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_compiler.h"
# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h" 1
# 29 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"
# 71 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma GCC diagnostic pop



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma GCC diagnostic pop



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma GCC diagnostic pop



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma GCC diagnostic pop



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma GCC diagnostic pop
# 131 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline __attribute__((__noreturn__)) void __cmsis_start(void)
{
  extern void _start(void) __attribute__((__noreturn__));

  typedef struct {
    uint32_t const* src;
    uint32_t* dest;
    uint32_t wlen;
  } __copy_table_t;

  typedef struct {
    uint32_t* dest;
    uint32_t wlen;
  } __zero_table_t;

  extern const __copy_table_t __copy_table_start__;
  extern const __copy_table_t __copy_table_end__;
  extern const __zero_table_t __zero_table_start__;
  extern const __zero_table_t __zero_table_end__;

  for (__copy_table_t const* pTable = &__copy_table_start__; pTable < &__copy_table_end__; ++pTable) {
    for(uint32_t i=0u; i<pTable->wlen; ++i) {
      pTable->dest[i] = pTable->src[i];
    }
  }

  for (__zero_table_t const* pTable = &__zero_table_start__; pTable < &__zero_table_end__; ++pTable) {
    for(uint32_t i=0u; i<pTable->wlen; ++i) {
      pTable->dest[i] = 0u;
    }
  }

  _start();
}
# 258 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __ISB(void)
{
  __asm volatile ("isb 0xF":::"memory");
}







__attribute__((always_inline)) static inline void __DSB(void)
{
  __asm volatile ("dsb 0xF":::"memory");
}







__attribute__((always_inline)) static inline void __DMB(void)
{
  __asm volatile ("dmb 0xF":::"memory");
}
# 292 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __REV(uint32_t value)
{

  return __builtin_bswap32(value);






}
# 311 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __REV16(uint32_t value)
{
  uint32_t result;

  __asm ("rev16 %0, %1" : "=r" (result) : "r" (value) );
  return result;
}
# 326 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline int16_t __REVSH(int16_t value)
{

  return (int16_t)__builtin_bswap16(value);






}
# 346 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  op2 %= 32U;
  if (op2 == 0U)
  {
    return op1;
  }
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 373 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __RBIT(uint32_t value)
{
  uint32_t result;




   __asm ("rbit %0, %1" : "=r" (result) : "r" (value) );
# 393 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
  return result;
}
# 403 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint8_t __CLZ(uint32_t value)
{
# 414 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
  if (value == 0U)
  {
    return 32U;
  }
  return __builtin_clz(value);
}
# 432 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint8_t __LDREXB(volatile uint8_t *addr)
{
    uint32_t result;


   __asm volatile ("ldrexb %0, %1" : "=r" (result) : "Q" (*addr) );






   return ((uint8_t) result);
}
# 454 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint16_t __LDREXH(volatile uint16_t *addr)
{
    uint32_t result;


   __asm volatile ("ldrexh %0, %1" : "=r" (result) : "Q" (*addr) );






   return ((uint16_t) result);
}
# 476 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __LDREXW(volatile uint32_t *addr)
{
    uint32_t result;

   __asm volatile ("ldrex %0, %1" : "=r" (result) : "Q" (*addr) );
   return(result);
}
# 493 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __STREXB(uint8_t value, volatile uint8_t *addr)
{
   uint32_t result;

   __asm volatile ("strexb %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
   return(result);
}
# 510 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __STREXH(uint16_t value, volatile uint16_t *addr)
{
   uint32_t result;

   __asm volatile ("strexh %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
   return(result);
}
# 527 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __STREXW(uint32_t value, volatile uint32_t *addr)
{
   uint32_t result;

   __asm volatile ("strex %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" (value) );
   return(result);
}






__attribute__((always_inline)) static inline void __CLREX(void)
{
  __asm volatile ("clrex" ::: "memory");
}
# 593 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rrx %0, %1" : "=r" (result) : "r" (value) );
  return(result);
}
# 608 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint8_t __LDRBT(volatile uint8_t *ptr)
{
    uint32_t result;


   __asm volatile ("ldrbt %0, %1" : "=r" (result) : "Q" (*ptr) );






   return ((uint8_t) result);
}
# 630 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint16_t __LDRHT(volatile uint16_t *ptr)
{
    uint32_t result;


   __asm volatile ("ldrht %0, %1" : "=r" (result) : "Q" (*ptr) );






   return ((uint16_t) result);
}
# 652 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __LDRT(volatile uint32_t *ptr)
{
    uint32_t result;

   __asm volatile ("ldrt %0, %1" : "=r" (result) : "Q" (*ptr) );
   return(result);
}
# 667 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __STRBT(uint8_t value, volatile uint8_t *ptr)
{
   __asm volatile ("strbt %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 679 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __STRHT(uint16_t value, volatile uint16_t *ptr)
{
   __asm volatile ("strht %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 691 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __STRT(uint32_t value, volatile uint32_t *ptr)
{
   __asm volatile ("strt %1, %0" : "=Q" (*ptr) : "r" (value) );
}
# 949 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __enable_irq(void)
{
  __asm volatile ("cpsie i" : : : "memory");
}







__attribute__((always_inline)) static inline void __disable_irq(void)
{
  __asm volatile ("cpsid i" : : : "memory");
}







__attribute__((always_inline)) static inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 1001 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
  __ISB();
}
# 1027 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static inline uint32_t __get_PSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, psp" : "=r" (result) );
  return(result);
}
# 1099 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}
# 1123 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __get_MSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, msp" : "=r" (result) );
  return(result);
}
# 1153 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}
# 1204 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}
# 1234 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 1261 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __enable_fault_irq(void)
{
  __asm volatile ("cpsie f" : : : "memory");
}







__attribute__((always_inline)) static inline void __disable_fault_irq(void)
{
  __asm volatile ("cpsid f" : : : "memory");
}







__attribute__((always_inline)) static inline uint32_t __get_BASEPRI(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, basepri" : "=r" (result) );
  return(result);
}
# 1313 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_BASEPRI(uint32_t basePri)
{
  __asm volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}
# 1338 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  __asm volatile ("MSR basepri_max, %0" : : "r" (basePri) : "memory");
}







__attribute__((always_inline)) static inline uint32_t __get_FAULTMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, faultmask" : "=r" (result) );
  return(result);
}
# 1379 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __set_FAULTMASK(uint32_t faultMask)
{
  __asm volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}
# 1588 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __get_FPSCR(void)
{
# 1604 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
  return(0U);

}







__attribute__((always_inline)) static inline void __set_FPSCR(uint32_t fpscr)
{
# 1627 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
  (void)fpscr;

}
# 1643 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __SADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __QADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("qadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SHADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("shadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UQADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uqadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UHADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uhadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}


__attribute__((always_inline)) static inline uint32_t __SSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __QSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("qsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SHSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("shsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __USUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UQSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uqsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UHSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uhsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}


__attribute__((always_inline)) static inline uint32_t __SADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __QADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("qadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SHADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("shadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UQADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uqadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UHADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uhadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __QSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("qsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SHSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("shsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __USUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UQSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uqsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UHSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uhsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __QASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("qasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SHASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("shasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UQASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uqasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UHASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uhasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __QSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("qsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SHSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("shsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __USAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UQSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uqsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UHSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uhsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __USAD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("usad8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __USADA8(uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm ("usada8 %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}
# 1965 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __UXTB16(uint32_t op1)
{
  uint32_t result;

  __asm ("uxtb16 %0, %1" : "=r" (result) : "r" (op1));
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __UXTAB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("uxtab16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SXTB16(uint32_t op1)
{
  uint32_t result;

  __asm ("sxtb16 %0, %1" : "=r" (result) : "r" (op1));
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SXTB16_RORn(uint32_t op1, uint32_t rotate)
{
  uint32_t result;
  if (__builtin_constant_p(rotate) && ((rotate == 8U) || (rotate == 16U) || (rotate == 24U))) {
    __asm volatile ("sxtb16 %0, %1, ROR %2" : "=r" (result) : "r" (op1), "i" (rotate) );
  } else {
    result = __SXTB16(__ROR(op1, rotate)) ;
  }
  return result;
}

__attribute__((always_inline)) static inline uint32_t __SXTAB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm ("sxtab16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SXTAB16_RORn(uint32_t op1, uint32_t op2, uint32_t rotate)
{
  uint32_t result;
  if (__builtin_constant_p(rotate) && ((rotate == 8U) || (rotate == 16U) || (rotate == 24U))) {
    __asm volatile ("sxtab16 %0, %1, %2, ROR %3" : "=r" (result) : "r" (op1) , "r" (op2) , "i" (rotate));
  } else {
    result = __SXTAB16(op1, __ROR(op2, rotate));
  }
  return result;
}


__attribute__((always_inline)) static inline uint32_t __SMUAD (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smuad %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SMUADX (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smuadx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SMLAD (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlad %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SMLADX (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smladx %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static inline uint64_t __SMLALD (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlald %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static inline uint64_t __SMLALDX (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlaldx %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static inline uint32_t __SMUSD (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smusd %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SMUSDX (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smusdx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SMLSD (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlsd %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static inline uint32_t __SMLSDX (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlsdx %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static inline uint64_t __SMLSLD (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlsld %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static inline uint64_t __SMLSLDX (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlsldx %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static inline uint32_t __SEL (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sel %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline int32_t __QADD( int32_t op1, int32_t op2)
{
  int32_t result;

  __asm volatile ("qadd %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static inline int32_t __QSUB( int32_t op1, int32_t op2)
{
  int32_t result;

  __asm volatile ("qsub %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}
# 2197 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline int32_t __SMMLA (int32_t op1, int32_t op2, int32_t op3)
{
 int32_t result;

 __asm ("smmla %0, %1, %2, %3" : "=r" (result): "r" (op1), "r" (op2), "r" (op3) );
 return(result);
}





#pragma GCC diagnostic pop
# 55 "C:/Users/peppe/OneDrive/Desktop/fft_test/CMSIS_5/CMSIS/Core/Include/cmsis_compiler.h" 2
# 83 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h" 2




# 1 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/string.h" 1 3 4
# 46 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/string.h" 3 4

# 46 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/string.h" 3 4
typedef unsigned int size_t;
# 56 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/string.h" 3 4
void * (memcpy) (void *__s1, const void *__s2, size_t __n);
void * (memccpy) (void *__s1, const void *__s2, int __c, size_t __n);
void * (mempcpy) (void *__s1, const void *__s2, size_t __n);
void * (memmove) (void *__s1, const void *__s2, size_t __n);
int (memcmp) (const void *__s1, const void *__s2, size_t __n);
size_t (memlcp) (const void *__s1, const void *__s2, size_t __n);
void * (memchr) (const void *__s, int __c, size_t __n);
void * (memrchr) (const void *__s, int __c, size_t __n);
void * (memmem) (const void *__s1, size_t __n1, const void *__s2, size_t __n2);
void * (memset) (void *__s, int __c, size_t __n);
char * (strcpy) (char *__s1, const char *__s2);
char * (stpcpy) (char *__s1, const char *__s2);
char * (strncpy) (char *__s1, const char *__s2, size_t __n);
char * (stpncpy) (char *__s1, const char *__s2, size_t __n);
size_t (strlcpy) (char *__s1, const char *__s2, size_t __n);
char * (strcat) (char *__s1, const char *__s2);
char * (strncat) (char *__s1, const char *__s2, size_t __n);
size_t (strlcat) (char *__s1, const char *__s2, size_t __n);
int (strcmp) (const char *__s1, const char *__s2);
int (strncmp) (const char *__s1, const char *__s2, size_t __n);
int (strcasecmp) (const char *__s1, const char *__s2);
int (strncasecmp) (const char *__s1, const char *__s2, size_t __n);
int (strcoll) (const char *__s1, const char *__s2);
char * (strchr) (const char *__s, int __c);
char * (strnchr) (const char *__str, size_t __n, int __ch);
size_t (strcspn) (const char *__s1, const char *__s2);
char * (strpbrk) (const char *__s1, const char *__s2);
char * (strrchr) (const char *__s, int __c);
size_t (strspn) (const char *__s1, const char *__s2);
char * (strstr) (const char *__s1, const char *__s2);
char * (strnstr) (const char *__s1, const char *__s2, size_t __n);
char * (strcasestr) (const char *__s1, const char *__s2);
char * (strncasestr) (const char *__s1, const char *__s2, size_t __n);
size_t (strlen) (const char *__s);
size_t (strnlen) (const char *__s, size_t __n);
size_t (strxfrm) (char *__s1, const char *__s2, size_t __n);
char * (strtok) (char *__s1, const char *__s2);
char * (strtok_r) (char *__s1, const char *__s2, char **__s3);
char * (strsep) (char **__stringp, const char *__delim);
char * (strdup) (const char *__s1);
char * (strndup) (const char *__s1, size_t __n);
char * (strerror) (int __num);

int (ffs) (int __i);
int (ffsl) (long __i);
int (ffsll) (long long __i);
# 88 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h" 2
# 1 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h" 1 3 4
# 20 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h" 3 4
# 1 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_FP.h" 1 3 4
# 68 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_FP.h" 3 4
float sinf (float __x);
double sin (double __x);
float cosf (float __x);
double cos (double __x);
float tanf (float __x);
double tan (double __x);
float asinf (float __x);
double asin (double __x);
float acosf (float __x);
double acos (double __x);
float atanf (float __x);
double atan (double __x);
float atan2f (float __y, float __x);
double atan2 (double __y, double __x);
float frexpf (float __x, int *__exp);
double frexp (double __x, int *__exp);
float ldexpf (float __x, int __exp);
double ldexp (double __x, int __exp);
float scalbnf (float __x, int __exp);
double scalbn (double __x, int __exp);
float logf (float __x);
double log (double __x);
float log1pf (float __x);
double log1p (double __x);
float log10f (float __x);
double log10 (double __x);
float log2f (float __x);
double log2 (double __x);
int ilogbf (float __x);
int ilogb (double __x);
float fmodf (float __x, float __y);
double fmod (double __x, double __y);
float modff (float __x, float *__iptr);
double modf (double __x, double *__iptr);
float powf (float __x, float __y);
double pow (double __x, double __y);
float sqrtf (float __x);
double sqrt (double __x);
float cbrtf (float __x);
double cbrt (double __x);
float rsqrtf (float __x);
double rsqrt (double __x);
float ceilf (float __x);
double ceil (double __x);
float fabsf (float __x);
double fabs (double __x);
float fminf (float __x, float __y);
double fmin (double __x, double __y);
float fmaxf (float __x, float __y);
double fmax (double __x, double __y);
float floorf (float __x);
double floor (double __x);
float hypotf (float __x, float __y);
double hypot (double __x, double __y);
float sinhf (float __x);
double sinh (double __x);
float coshf (float __x);
double cosh (double __x);
float tanhf (float __x);
double tanh (double __x);
float acoshf (float __x);
double acosh (double __x);
float asinhf (float __x);
double asinh (double __x);
float atanhf (float __x);
double atanh (double __x);
float fmaf (float __x, float __y, float __z);
double fma (double __x, double __y, double __z);
float expf (float __x);
double exp (double __x);
float exp2f (float __x);
double exp2 (double __x);
float exp10f (float __x);
double exp10 (double __x);
# 345 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_FP.h" 3 4
float __addsf3 (float __x, float __y);
double __adddf3 (double __x, double __y);
float __subsf3 (float __x, float __y);
double __subdf3 (double __x, double __y);
float __mulsf3 (float __x, float __y);
double __muldf3 (double __x, double __y);
float __divsf3 (float __x, float __y);
double __divdf3 (double __x, double __y);
int __ltsf2 (float __x, float __y);
int __ltdf2 (double __x, double __y);
int __lesf2 (float __x, float __y);
int __ledf2 (double __x, double __y);
int __gtsf2 (float __x, float __y);
int __gtdf2 (double __x, double __y);
int __gesf2 (float __x, float __y);
int __gedf2 (double __x, double __y);
int __eqsf2 (float __x, float __y);
int __eqdf2 (double __x, double __y);
int __nesf2 (float __x, float __y);
int __nedf2 (double __x, double __y);
int __unordsf2 (float __x, float __y);
int __unorddf2 (double __x, double __y);
int __fixsfsi (float __x);
int __fixdfsi (double __x);





long long __fixsfdi (float f);
long long __fixdfdi (double __x);
unsigned long long __fixunsdfdi (double __x);

unsigned __fixunssfsi (float __x);
unsigned __fixunsdfsi (double __x);
float __floatsisf (long int __x);
double __floatsidf (long int __x);
float __floatunsisf (long unsigned int __x);



unsigned long long __fixunssfdi (float f);

double __floatunsidf (long unsigned int __x);
float __floatdisf (long long int __x);
double __floatdidf (long long int __x);
float __floatundisf (long long unsigned int __x);
double __floatundidf (long long unsigned int __x);
float __truncdfsf2 (double __x);
double __extendsfdf2 (float __x);
float __gnu_h2f_ieee (short unsigned int __x);
double __gnu_h2d_ieee (short unsigned int __x);
unsigned short __gnu_f2h_ieee (float __x);
unsigned short __gnu_d2h_ieee (double __x);
# 415 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_FP.h" 3 4
long unsigned int __aeabi_fadd (long unsigned int, long unsigned int);
long unsigned int __aeabi_fsub (long unsigned int, long unsigned int);
long unsigned int __aeabi_frsub (long unsigned int, long unsigned int);
long unsigned int __aeabi_fmul (long unsigned int, long unsigned int);
long unsigned int __aeabi_fdiv (long unsigned int, long unsigned int);
long int __aeabi_fcmplt (long unsigned int, long unsigned int);
long int __aeabi_fcmple (long unsigned int, long unsigned int);
long int __aeabi_fcmpgt (long unsigned int, long unsigned int);
long int __aeabi_fcmpge (long unsigned int, long unsigned int);
long int __aeabi_fcmpeq (long unsigned int, long unsigned int);
long long unsigned int __aeabi_dadd (long long unsigned int, long long unsigned int);
long long unsigned int __aeabi_dsub (long long unsigned int, long long unsigned int);
long long unsigned int __aeabi_drsub (long long unsigned int, long long unsigned int);
long long unsigned int __aeabi_dmul (long long unsigned int, long long unsigned int);
long long unsigned int __aeabi_ddiv (long long unsigned int, long long unsigned int);
long int __aeabi_dcmplt (long long unsigned int, long long unsigned int);
long int __aeabi_dcmple (long long unsigned int, long long unsigned int);
long int __aeabi_dcmpgt (long long unsigned int, long long unsigned int);
long int __aeabi_dcmpge (long long unsigned int, long long unsigned int);
long int __aeabi_dcmpeq (long long unsigned int, long long unsigned int);
long int __aeabi_f2iz (long unsigned int);
long unsigned int __aeabi_f2uiz (long unsigned int);
long long int __aeabi_f2lz (long unsigned int);
long long unsigned int __aeabi_f2ulz (long unsigned int);
long unsigned int __aeabi_i2f (long int);
long unsigned int __aeabi_ui2f (long unsigned int);
long unsigned int __aeabi_l2f (long long int);
long unsigned int __aeabi_ul2f (long long unsigned int);
long int __aeabi_d2iz (long long unsigned int);
long long int __aeabi_d2lz (long long unsigned int);
long unsigned int __aeabi_d2uiz (long long unsigned int);
long long unsigned int __aeabi_d2ulz (long long unsigned int);
long long unsigned int __aeabi_i2d (long int);
long long unsigned int __aeabi_ui2d (long unsigned int);
long long unsigned int __aeabi_l2d (long long int);
long long unsigned int __aeabi_ul2d (long long unsigned int);
long long unsigned int __aeabi_f2d (long unsigned int);
long unsigned int __aeabi_d2f (long long unsigned int);
short unsigned int __aeabi_f2h (long unsigned int);
short unsigned int __aeabi_d2h (long long unsigned int);
long unsigned int __aeabi_h2f (short unsigned int);
long long unsigned int __aeabi_h2d (short unsigned int);
# 467 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_FP.h" 3 4
int __SEGGER_RTL_float32_isinf (float);
int __SEGGER_RTL_float64_isinf (double);
int __SEGGER_RTL_float32_isnan (float);
int __SEGGER_RTL_float64_isnan (double);
int __SEGGER_RTL_float32_isfinite (float);
int __SEGGER_RTL_float64_isfinite (double);
int __SEGGER_RTL_float32_isnormal (float);
int __SEGGER_RTL_float64_isnormal (double);
int __SEGGER_RTL_float32_signbit (float);
int __SEGGER_RTL_float64_signbit (double);
int __SEGGER_RTL_float32_classify (float);
int __SEGGER_RTL_float64_classify (double);





typedef struct {
  float Re;
  float Im;
} __SEGGER_RTL_FLOAT32_PSEUDO_COMPLEX;

typedef struct {
  union {
    __SEGGER_RTL_FLOAT32_PSEUDO_COMPLEX part;

    float _Complex value;

  } u;
} __SEGGER_RTL_FLOAT32_COMPLEX;

typedef struct {
  double Re;
  double Im;
} __SEGGER_RTL_FLOAT64_PSEUDO_COMPLEX;

typedef struct {
  union {
    __SEGGER_RTL_FLOAT64_PSEUDO_COMPLEX part;

    double _Complex value;

  } u;
} __SEGGER_RTL_FLOAT64_COMPLEX;

typedef struct {
  long double Re;
  long double Im;
} __SEGGER_RTL_LDOUBLE_PSEUDO_COMPLEX;

typedef struct {
  union {
    __SEGGER_RTL_LDOUBLE_PSEUDO_COMPLEX part;

    long double _Complex value;

  } u;
} __SEGGER_RTL_LDOUBLE_COMPLEX;
# 21 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h" 2 3 4
# 88 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h" 3 4
typedef float float_t;
typedef double double_t;
# 98 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h" 3 4
int __SEGGER_RTL_float32_isinf (float);
int __SEGGER_RTL_float64_isinf (double);
int __SEGGER_RTL_float32_isnan (float);
int __SEGGER_RTL_float64_isnan (double);
int __SEGGER_RTL_float32_isfinite (float);
int __SEGGER_RTL_float64_isfinite (double);
int __SEGGER_RTL_float32_isnormal (float);
int __SEGGER_RTL_float64_isnormal (double);
int __SEGGER_RTL_float32_signbit (float);
int __SEGGER_RTL_float64_signbit (double);
int __SEGGER_RTL_float32_classify (float);
int __SEGGER_RTL_float64_classify (double);
# 122 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h" 3 4
float cosf (float __x);
float sinf (float __x);
float tanf (float __x);
float asinf (float __x);
float acosf (float __x);
float atanf (float __x);
float atan2f (float __y, float __x);
void sincosf (float __x, float *pSin, float *pCos);





float sinhf (float __x);
float coshf (float __x);
float tanhf (float __x);
float acoshf (float __x);
float asinhf (float __x);
float atanhf (float __x);





float logf (float __x);
float log2f (float __x);
float log10f (float __x);
float logbf (float __x);
float log1pf (float __x);
int ilogbf (float __x);
float expf (float __x);
float exp2f (float __x);
float exp10f (float __x);
float expm1f (float __x);
float sqrtf (float __x);
float cbrtf (float __x);
float rsqrtf (float __x);
float hypotf (float __x, float __y);
float powf (float __x, float __y);





float fminf (float __x, float __y);
float fmaxf (float __x, float __y);
float fdimf (float __x, float __y);
float fabsf (float __x);





float tgammaf (float __x);
float lgammaf (float __x);
float erff (float __x);
float erfcf (float __x);





float ceilf (float __x);
float floorf (float __x);
float truncf (float __x);
float rintf (float __x);
long lrintf (float __x);
long long llrintf (float __x);
float roundf (float __x);
long lroundf (float __x);
long long llroundf (float __x);
float nearbyintf (float __x);





float fmodf (float __x, float __y);
float remainderf (float __x, float __y);
float remquof (float __x, float __y, int *__quo);
float modff (float __x, float *__iptr);
float frexpf (float __x, int *__exp);
float ldexpf (float __x, int __exp);
float scalbnf (float __x, int __exp);
float scalblnf (float __x, long __exp);
float copysignf (float __x, float __y);
float nextafterf (float __x, float __y);
float nexttowardf(float __x, long double __y);
float nanf (const char *__tag);
# 223 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h" 3 4
double sin (double __x);
double cos (double __x);
double tan (double __x);
double asin (double __x);
double acos (double __x);
double atan (double __x);
double atan2 (double __y, double __x);
void sincos (double __x, double *pSin, double *pCos);





double sinh (double __x);
double cosh (double __x);
double tanh (double __x);
double asinh (double __x);
double acosh (double __x);
double atanh (double __x);





double log (double __x);
double log2 (double __x);
double log10 (double __x);
double logb (double __x);
double log1p (double __x);
int ilogb (double __x);
double exp (double __x);
double exp2 (double __x);
double exp10 (double __x);
double expm1 (double __x);
double sqrt (double __x);
double cbrt (double __x);
double rsqrt (double __x);
double hypot (double __x, double __y);
double pow (double __x, double __y);





double fmin (double __x, double __y);
double fmax (double __x, double __y);
double fdim (double __x, double __y);
double fabs (double __x);





double tgamma (double __x);
double lgamma (double __x);
double erf (double __x);
double erfc (double __x);





double ceil (double __x);
double floor (double __x);
double trunc (double __x);
double rint (double __x);
long lrint (double __x);
long long llrint (double __x);
double round (double __x);
long lround (double __x);
long long llround (double __x);
double nearbyint (double __x);





double fmod (double __x, double __y);
double remainder (double __x, double __y);
double remquo (double __x, double __y, int *__quo);
double modf (double __x, double *__iptr);
double frexp (double __x, int *__exp);
double ldexp (double __x, int __exp);
double scalbn (double __x, int __exp);
double scalbln (double __x, long __exp);
double copysign (double __x, double __y);
double nextafter (double __x, double __y);
double nexttoward (double __x, long double __y);
double nan (const char *__tag);
# 324 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h" 3 4
long double sinl (long double __x);
long double cosl (long double __x);
long double tanl (long double __x);
long double asinl (long double __x);
long double acosl (long double __x);
long double atanl (long double __x);
long double atan2l (long double __y, long double __x);
void sincosl (long double __x, long double *pSin, long double *pCos);





long double sinhl (long double __x);
long double coshl (long double __x);
long double tanhl (long double __x);
long double asinhl (long double __x);
long double acoshl (long double __x);
long double atanhl (long double __x);





long double logl (long double __x);
long double log2l (long double __x);
long double log10l (long double __x);
long double logbl (long double __x);
long double log1pl (long double __x);
int ilogbl (long double __x);
long double expl (long double __x);
long double exp2l (long double __x);
long double exp10l (long double __x);
long double expm1l (long double __x);
long double sqrtl (long double __x);
long double cbrtl (long double __x);
long double rsqrtl (long double __x);
long double hypotl (long double __x, long double __y);
long double powl (long double __x, long double __y);





long double fminl (long double __x, long double __y);
long double fmaxl (long double __x, long double __y);
long double fdiml (long double __x, long double __y);
long double fabsl (long double __x);





long double tgammal (long double __x);
long double lgammal (long double __x);
long double erfl (long double __x);
long double erfcl (long double __x);





long double ceill (long double __x);
long double floorl (long double __x);
long double truncl (long double __x);
long double rintl (long double __x);
long lrintl (long double __x);
long long llrintl (long double __x);
long double roundl (long double __x);
long lroundl (long double __x);
long long llroundl (long double __x);
long double nearbyintl (long double __x);





long double fmodl (long double __x, long double __y);
long double remainderl (long double __x, long double __y);
long double remquol (long double __x, long double __y, int *__quo);
long double modfl (long double __x, long double *__iptr);
long double frexpl (long double __x, int *__exp);
long double ldexpl (long double __x, int __exp);
long double scalbnl (long double __x, int __exp);
long double scalblnl (long double __x, long __exp);
long double copysignl (long double __x, long double __y);
long double nextafterl (long double __x, long double __y);
long double nexttowardl(long double __x, long double __y);
long double nanl (const char *__tag);

float fmaf (float __x, float __y, float __z);
double fma (double __x, double __y, double __z);
long double fmal (long double __x, long double __y, long double __z);
# 89 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h" 2
# 1 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/float.h" 1 3 4
# 90 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h" 2
# 1 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/limits.h" 1 3 4
# 91 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h" 2
# 250 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h"
#pragma GCC diagnostic pop
# 282 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h"
  typedef int8_t q7_t;




  typedef int16_t q15_t;




  typedef int32_t q31_t;




  typedef int64_t q63_t;





  typedef float float32_t;





  typedef double float64_t;
# 599 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h"
  typedef enum
  {
    ARM_MATH_SUCCESS = 0,
    ARM_MATH_ARGUMENT_ERROR = -1,
    ARM_MATH_LENGTH_ERROR = -2,
    ARM_MATH_SIZE_MISMATCH = -3,
    ARM_MATH_NANINF = -4,
    ARM_MATH_SINGULAR = -5,
    ARM_MATH_TEST_FAILURE = -6,
    ARM_MATH_DECOMPOSITION_FAILURE = -7
  } arm_status;
# 31 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h" 2
# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_memory.h" 1
# 30 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_memory.h"
# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_types.h" 1
# 31 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_memory.h" 2
# 76 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_memory.h"
__attribute__((always_inline)) static inline q31_t read_q15x2 (
  q15_t const * pQ15)
{
  q31_t val;


  memcpy (&val, pQ15, 4);




  return (val);
}
# 110 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_memory.h"
__attribute__((always_inline)) static inline void write_q15x2_ia (
  q15_t ** pQ15,
  q31_t value)
{
  q31_t val = value;

  memcpy (*pQ15, &val, 4);





 *pQ15 += 2;
}







__attribute__((always_inline)) static inline void write_q15x2 (
  q15_t * pQ15,
  q31_t value)
{
  q31_t val = value;


  memcpy (pQ15, &val, 4);




}







__attribute__((always_inline)) static inline q31_t read_q7x4 (
  q7_t const * pQ7)
{
  q31_t val;


  memcpy (&val, pQ7, 4);



  return (val);
}
# 184 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/arm_math_memory.h"
__attribute__((always_inline)) static inline void write_q7x4_ia (
  q7_t ** pQ7,
  q31_t value)
{
  q31_t val = value;

  memcpy (*pQ7, &val, 4);







  *pQ7 += 4;
}
# 32 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h" 2

# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/none.h" 1
# 136 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/none.h"
  __attribute__((always_inline)) static inline q31_t clip_q63_to_q31(
  q63_t x)
  {
    return ((q31_t) (x >> 32) != ((q31_t) x >> 31)) ?
      ((0x7FFFFFFF ^ ((q31_t) (x >> 63)))) : (q31_t) x;
  }




  __attribute__((always_inline)) static inline q15_t clip_q63_to_q15(
  q63_t x)
  {
    return ((q31_t) (x >> 32) != ((q31_t) x >> 31)) ?
      ((0x7FFF ^ ((q15_t) (x >> 63)))) : (q15_t) (x >> 15);
  }




  __attribute__((always_inline)) static inline q7_t clip_q31_to_q7(
  q31_t x)
  {
    return ((q31_t) (x >> 24) != ((q31_t) x >> 23)) ?
      ((0x7F ^ ((q7_t) (x >> 31)))) : (q7_t) x;
  }




  __attribute__((always_inline)) static inline q15_t clip_q31_to_q15(
  q31_t x)
  {
    return ((q31_t) (x >> 16) != ((q31_t) x >> 15)) ?
      ((0x7FFF ^ ((q15_t) (x >> 31)))) : (q15_t) x;
  }




  __attribute__((always_inline)) static inline q63_t mult32x64(
  q63_t x,
  q31_t y)
  {
    return ((((q63_t) (x & 0x00000000FFFFFFFF) * y) >> 32) +
            (((q63_t) (x >> 32) * y) ) );
  }
# 34 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h" 2
# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/utils.h" 1
# 51 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/utils.h"
  __attribute__((always_inline)) static inline uint32_t arm_recip_q31(
        q31_t in,
        q31_t * dst,
  const q31_t * pRecipTable)
  {
    q31_t out;
    uint32_t tempVal;
    uint32_t index, i;
    uint32_t signBits;

    if (in > 0)
    {
      signBits = ((uint32_t) (__CLZ( in) - 1));
    }
    else
    {
      signBits = ((uint32_t) (__CLZ(-in) - 1));
    }


    in = (in << signBits);


    index = (uint32_t)(in >> 24);
    index = (index & 0x0000003F);


    out = pRecipTable[index];



    for (i = 0U; i < 2U; i++)
    {
      tempVal = (uint32_t) (((q63_t) in * out) >> 31);
      tempVal = 0x7FFFFFFFu - tempVal;


      out = clip_q63_to_q31(((q63_t) out * tempVal) >> 30);
    }


    *dst = out;


    return (signBits + 1U);
  }





  __attribute__((always_inline)) static inline uint32_t arm_recip_q15(
        q15_t in,
        q15_t * dst,
  const q15_t * pRecipTable)
  {
    q15_t out = 0;
    uint32_t tempVal = 0;
    uint32_t index = 0, i = 0;
    uint32_t signBits = 0;

    if (in > 0)
    {
      signBits = ((uint32_t)(__CLZ( in) - 17));
    }
    else
    {
      signBits = ((uint32_t)(__CLZ(-in) - 17));
    }


    in = (in << signBits);


    index = (uint32_t)(in >> 8);
    index = (index & 0x0000003F);


    out = pRecipTable[index];



    for (i = 0U; i < 2U; i++)
    {
      tempVal = (uint32_t) (((q31_t) in * out) >> 15);
      tempVal = 0x7FFFu - tempVal;

      out = (q15_t) (((q31_t) out * tempVal) >> 14);

    }


    *dst = out;


    return (signBits + 1);
  }
# 156 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/utils.h"
static inline void arm_norm_64_to_32u(uint64_t in, int32_t * normalized, int32_t *norm)
{
    int32_t n1;
    int32_t hi = (int32_t) (in >> 32);
    int32_t lo = (int32_t) ((in << 32) >> 32);

    n1 = __CLZ(hi) - 32;
    if (!n1)
    {



        n1 = __CLZ(lo);
        if (!n1)
        {



            *norm = -1;
            *normalized = (((uint32_t) lo) >> 1);
        } else
        {
            if (n1 == 32)
            {



                *norm = 0;
                *normalized = 0;
            } else
            {



                *norm = n1 - 1;
                *normalized = lo << *norm;
            }
        }
    } else
    {



        n1 = 1 - n1;
        *norm = -n1;



        *normalized = (((uint32_t) lo) >> n1) | (hi << (32 - n1));
    }
}

static inline q31_t arm_div_q63_to_q31(q63_t num, q31_t den)
{
    q31_t result;
    uint64_t absNum;
    int32_t normalized;
    int32_t norm;





    absNum = num > 0 ? num : -num;
    arm_norm_64_to_32u(absNum, &normalized, &norm);
    if (norm > 0)



        result = (q31_t) num / den;
    else



        result = (q31_t) (num / den);

    return result;
}
# 35 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h" 2

# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h" 1
# 53 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_mult_q7(
  const q7_t * pSrcA,
  const q7_t * pSrcB,
        q7_t * pDst,
        uint32_t blockSize);
# 67 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_mult_q15(
  const q15_t * pSrcA,
  const q15_t * pSrcB,
        q15_t * pDst,
        uint32_t blockSize);
# 81 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_mult_q31(
  const q31_t * pSrcA,
  const q31_t * pSrcB,
        q31_t * pDst,
        uint32_t blockSize);
# 95 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_mult_f32(
  const float32_t * pSrcA,
  const float32_t * pSrcB,
        float32_t * pDst,
        uint32_t blockSize);
# 110 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
void arm_mult_f64(
const float64_t * pSrcA,
const float64_t * pSrcB,
   float64_t * pDst,
   uint32_t blockSize);
# 125 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_add_f32(
  const float32_t * pSrcA,
  const float32_t * pSrcB,
        float32_t * pDst,
        uint32_t blockSize);
# 140 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
 void arm_add_f64(
 const float64_t * pSrcA,
 const float64_t * pSrcB,
    float64_t * pDst,
    uint32_t blockSize);
# 155 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_add_q7(
  const q7_t * pSrcA,
  const q7_t * pSrcB,
        q7_t * pDst,
        uint32_t blockSize);
# 169 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_add_q15(
  const q15_t * pSrcA,
  const q15_t * pSrcB,
        q15_t * pDst,
        uint32_t blockSize);
# 183 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_add_q31(
  const q31_t * pSrcA,
  const q31_t * pSrcB,
        q31_t * pDst,
        uint32_t blockSize);
# 197 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_sub_f32(
  const float32_t * pSrcA,
  const float32_t * pSrcB,
        float32_t * pDst,
        uint32_t blockSize);
# 212 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_sub_f64(
  const float64_t * pSrcA,
  const float64_t * pSrcB,
        float64_t * pDst,
        uint32_t blockSize);
# 227 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_sub_q7(
  const q7_t * pSrcA,
  const q7_t * pSrcB,
        q7_t * pDst,
        uint32_t blockSize);
# 241 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_sub_q15(
  const q15_t * pSrcA,
  const q15_t * pSrcB,
        q15_t * pDst,
        uint32_t blockSize);
# 255 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_sub_q31(
  const q31_t * pSrcA,
  const q31_t * pSrcB,
        q31_t * pDst,
        uint32_t blockSize);
# 269 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_scale_f32(
  const float32_t * pSrc,
        float32_t scale,
        float32_t * pDst,
        uint32_t blockSize);
# 284 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_scale_f64(
  const float64_t * pSrc,
        float64_t scale,
        float64_t * pDst,
        uint32_t blockSize);
# 300 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_scale_q7(
  const q7_t * pSrc,
        q7_t scaleFract,
        int8_t shift,
        q7_t * pDst,
        uint32_t blockSize);
# 316 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_scale_q15(
  const q15_t * pSrc,
        q15_t scaleFract,
        int8_t shift,
        q15_t * pDst,
        uint32_t blockSize);
# 332 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_scale_q31(
  const q31_t * pSrc,
        q31_t scaleFract,
        int8_t shift,
        q31_t * pDst,
        uint32_t blockSize);
# 346 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_abs_q7(
  const q7_t * pSrc,
        q7_t * pDst,
        uint32_t blockSize);
# 358 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_abs_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t blockSize);
# 371 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
void arm_abs_f64(
const float64_t * pSrc,
   float64_t * pDst,
   uint32_t blockSize);
# 384 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_abs_q15(
  const q15_t * pSrc,
        q15_t * pDst,
        uint32_t blockSize);
# 396 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_abs_q31(
  const q31_t * pSrc,
        q31_t * pDst,
        uint32_t blockSize);
# 409 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_dot_prod_f32(
  const float32_t * pSrcA,
  const float32_t * pSrcB,
        uint32_t blockSize,
        float32_t * result);
# 424 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
void arm_dot_prod_f64(
const float64_t * pSrcA,
const float64_t * pSrcB,
   uint32_t blockSize,
   float64_t * result);
# 439 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_dot_prod_q7(
  const q7_t * pSrcA,
  const q7_t * pSrcB,
        uint32_t blockSize,
        q31_t * result);
# 453 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_dot_prod_q15(
  const q15_t * pSrcA,
  const q15_t * pSrcB,
        uint32_t blockSize,
        q63_t * result);
# 467 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_dot_prod_q31(
  const q31_t * pSrcA,
  const q31_t * pSrcB,
        uint32_t blockSize,
        q63_t * result);
# 481 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_shift_q7(
  const q7_t * pSrc,
        int8_t shiftBits,
        q7_t * pDst,
        uint32_t blockSize);
# 495 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_shift_q15(
  const q15_t * pSrc,
        int8_t shiftBits,
        q15_t * pDst,
        uint32_t blockSize);
# 509 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_shift_q31(
  const q31_t * pSrc,
        int8_t shiftBits,
        q31_t * pDst,
        uint32_t blockSize);
# 523 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
void arm_offset_f64(
const float64_t * pSrc,
   float64_t offset,
   float64_t * pDst,
   uint32_t blockSize);
# 538 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_offset_f32(
  const float32_t * pSrc,
        float32_t offset,
        float32_t * pDst,
        uint32_t blockSize);
# 553 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_offset_q7(
  const q7_t * pSrc,
        q7_t offset,
        q7_t * pDst,
        uint32_t blockSize);
# 567 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_offset_q15(
  const q15_t * pSrc,
        q15_t offset,
        q15_t * pDst,
        uint32_t blockSize);
# 581 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_offset_q31(
  const q31_t * pSrc,
        q31_t offset,
        q31_t * pDst,
        uint32_t blockSize);
# 594 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_negate_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t blockSize);
# 607 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
void arm_negate_f64(
const float64_t * pSrc,
   float64_t * pDst,
   uint32_t blockSize);
# 620 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_negate_q7(
  const q7_t * pSrc,
        q7_t * pDst,
        uint32_t blockSize);
# 632 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_negate_q15(
  const q15_t * pSrc,
        q15_t * pDst,
        uint32_t blockSize);
# 644 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_negate_q31(
  const q31_t * pSrc,
        q31_t * pDst,
        uint32_t blockSize);
# 656 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_and_u16(
    const uint16_t * pSrcA,
    const uint16_t * pSrcB,
          uint16_t * pDst,
          uint32_t blockSize);
# 669 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_and_u32(
    const uint32_t * pSrcA,
    const uint32_t * pSrcB,
          uint32_t * pDst,
          uint32_t blockSize);
# 682 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_and_u8(
    const uint8_t * pSrcA,
    const uint8_t * pSrcB,
          uint8_t * pDst,
          uint32_t blockSize);
# 695 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_or_u16(
    const uint16_t * pSrcA,
    const uint16_t * pSrcB,
          uint16_t * pDst,
          uint32_t blockSize);
# 708 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_or_u32(
    const uint32_t * pSrcA,
    const uint32_t * pSrcB,
          uint32_t * pDst,
          uint32_t blockSize);
# 721 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_or_u8(
    const uint8_t * pSrcA,
    const uint8_t * pSrcB,
          uint8_t * pDst,
          uint32_t blockSize);







  void arm_not_u16(
    const uint16_t * pSrc,
          uint16_t * pDst,
          uint32_t blockSize);







  void arm_not_u32(
    const uint32_t * pSrc,
          uint32_t * pDst,
          uint32_t blockSize);







  void arm_not_u8(
    const uint8_t * pSrc,
          uint8_t * pDst,
          uint32_t blockSize);
# 767 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_xor_u16(
    const uint16_t * pSrcA,
    const uint16_t * pSrcB,
          uint16_t * pDst,
          uint32_t blockSize);
# 780 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_xor_u32(
    const uint32_t * pSrcA,
    const uint32_t * pSrcB,
          uint32_t * pDst,
          uint32_t blockSize);
# 793 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
  void arm_xor_u8(
    const uint8_t * pSrcA,
    const uint8_t * pSrcB,
          uint8_t * pDst,
    uint32_t blockSize);
# 808 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
void arm_clip_f32(const float32_t * pSrc,
  float32_t * pDst,
  float32_t low,
  float32_t high,
  uint32_t numSamples);
# 823 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
void arm_clip_q31(const q31_t * pSrc,
  q31_t * pDst,
  q31_t low,
  q31_t high,
  uint32_t numSamples);
# 838 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
void arm_clip_q15(const q15_t * pSrc,
  q15_t * pDst,
  q15_t low,
  q15_t high,
  uint32_t numSamples);
# 853 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/basic_math_functions.h"
void arm_clip_q7(const q7_t * pSrc,
  q7_t * pDst,
  q7_t low,
  q7_t high,
  uint32_t numSamples);
# 37 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h" 2
# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h" 1
# 35 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
# 1 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h" 1
# 78 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
  float32_t arm_sin_f32(
  float32_t x);







  q31_t arm_sin_q31(
  q31_t x);






  q15_t arm_sin_q15(
  q15_t x);







  float32_t arm_cos_f32(
  float32_t x);







  q31_t arm_cos_q31(
  q31_t x);







  q15_t arm_cos_q15(
  q15_t x);
# 132 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
  void arm_vlog_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t blockSize);
# 145 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
  void arm_vlog_f64(
  const float64_t * pSrc,
        float64_t * pDst,
        uint32_t blockSize);
# 158 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
  void arm_vlog_q31(const q31_t * pSrc,
        q31_t * pDst,
        uint32_t blockSize);







  void arm_vlog_q15(const q15_t * pSrc,
        q15_t * pDst,
        uint32_t blockSize);
# 180 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
  void arm_vexp_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t blockSize);
# 193 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
  void arm_vexp_f64(
  const float64_t * pSrc,
  float64_t * pDst,
  uint32_t blockSize);
# 234 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
__attribute__((always_inline)) static inline arm_status arm_sqrt_f32(
  const float32_t in,
  float32_t * pOut)
  {
    if (in >= 0.0f)
    {
# 260 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
      __asm("VSQRT.F32 %0,%1" : "=t"(*pOut) : "t"(in));







      return (ARM_MATH_SUCCESS);
    }
    else
    {
      *pOut = 0.0f;
      return (ARM_MATH_ARGUMENT_ERROR);
    }
  }
# 286 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
arm_status arm_sqrt_q31(
  q31_t in,
  q31_t * pOut);
# 299 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
arm_status arm_sqrt_q15(
  q15_t in,
  q15_t * pOut);
# 321 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
arm_status arm_divide_q15(q15_t numerator,
  q15_t denominator,
  q15_t *quotient,
  int16_t *shift);
# 338 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
arm_status arm_divide_q31(q31_t numerator,
  q31_t denominator,
  q31_t *quotient,
  int16_t *shift);
# 352 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
  arm_status arm_atan2_f32(float32_t y,float32_t x,float32_t *result);
# 362 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
  arm_status arm_atan2_q31(q31_t y,q31_t x,q31_t *result);
# 371 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/fast_math_functions.h"
  arm_status arm_atan2_q15(q15_t y,q15_t x,q15_t *result);
# 36 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h" 2
# 58 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_conj_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t numSamples);







  void arm_cmplx_conj_q31(
  const q31_t * pSrc,
        q31_t * pDst,
        uint32_t numSamples);
# 81 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_conj_q15(
  const q15_t * pSrc,
        q15_t * pDst,
        uint32_t numSamples);
# 93 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mag_squared_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t numSamples);
# 105 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mag_squared_f64(
  const float64_t * pSrc,
        float64_t * pDst,
        uint32_t numSamples);
# 117 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mag_squared_q31(
  const q31_t * pSrc,
        q31_t * pDst,
        uint32_t numSamples);
# 129 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mag_squared_q15(
  const q15_t * pSrc,
        q15_t * pDst,
        uint32_t numSamples);
# 141 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mag_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t numSamples);
# 153 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mag_f64(
  const float64_t * pSrc,
        float64_t * pDst,
        uint32_t numSamples);
# 165 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mag_q31(
  const q31_t * pSrc,
        q31_t * pDst,
        uint32_t numSamples);
# 177 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mag_q15(
  const q15_t * pSrc,
        q15_t * pDst,
        uint32_t numSamples);







  void arm_cmplx_mag_fast_q15(
  const q15_t * pSrc,
        q15_t * pDst,
        uint32_t numSamples);
# 202 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_dot_prod_q15(
  const q15_t * pSrcA,
  const q15_t * pSrcB,
        uint32_t numSamples,
        q31_t * realResult,
        q31_t * imagResult);
# 218 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_dot_prod_q31(
  const q31_t * pSrcA,
  const q31_t * pSrcB,
        uint32_t numSamples,
        q63_t * realResult,
        q63_t * imagResult);
# 234 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_dot_prod_f32(
  const float32_t * pSrcA,
  const float32_t * pSrcB,
        uint32_t numSamples,
        float32_t * realResult,
        float32_t * imagResult);
# 249 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mult_real_q15(
  const q15_t * pSrcCmplx,
  const q15_t * pSrcReal,
        q15_t * pCmplxDst,
        uint32_t numSamples);
# 263 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mult_real_q31(
  const q31_t * pSrcCmplx,
  const q31_t * pSrcReal,
        q31_t * pCmplxDst,
        uint32_t numSamples);
# 277 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mult_real_f32(
  const float32_t * pSrcCmplx,
  const float32_t * pSrcReal,
        float32_t * pCmplxDst,
        uint32_t numSamples);
# 290 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mult_cmplx_q15(
  const q15_t * pSrcA,
  const q15_t * pSrcB,
        q15_t * pDst,
        uint32_t numSamples);
# 304 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mult_cmplx_q31(
  const q31_t * pSrcA,
  const q31_t * pSrcB,
        q31_t * pDst,
        uint32_t numSamples);
# 318 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
  void arm_cmplx_mult_cmplx_f32(
  const float32_t * pSrcA,
  const float32_t * pSrcB,
        float32_t * pDst,
        uint32_t numSamples);
# 333 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/complex_math_functions.h"
void arm_cmplx_mult_cmplx_f64(
const float64_t * pSrcA,
const float64_t * pSrcB,
   float64_t * pDst,
   uint32_t numSamples);
# 38 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h" 2
# 53 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  typedef struct
  {
          uint16_t fftLen;
          uint8_t ifftFlag;
          uint8_t bitReverseFlag;
    const q15_t *pTwiddle;
    const uint16_t *pBitRevTable;
          uint16_t twidCoefModifier;
          uint16_t bitRevFactor;
  } arm_cfft_radix2_instance_q15;


  arm_status arm_cfft_radix2_init_q15(
        arm_cfft_radix2_instance_q15 * S,
        uint16_t fftLen,
        uint8_t ifftFlag,
        uint8_t bitReverseFlag);


  void arm_cfft_radix2_q15(
  const arm_cfft_radix2_instance_q15 * S,
        q15_t * pSrc);





  typedef struct
  {
          uint16_t fftLen;
          uint8_t ifftFlag;
          uint8_t bitReverseFlag;
    const q15_t *pTwiddle;
    const uint16_t *pBitRevTable;
          uint16_t twidCoefModifier;
          uint16_t bitRevFactor;
  } arm_cfft_radix4_instance_q15;


  arm_status arm_cfft_radix4_init_q15(
        arm_cfft_radix4_instance_q15 * S,
        uint16_t fftLen,
        uint8_t ifftFlag,
        uint8_t bitReverseFlag);


  void arm_cfft_radix4_q15(
  const arm_cfft_radix4_instance_q15 * S,
        q15_t * pSrc);




  typedef struct
  {
          uint16_t fftLen;
          uint8_t ifftFlag;
          uint8_t bitReverseFlag;
    const q31_t *pTwiddle;
    const uint16_t *pBitRevTable;
          uint16_t twidCoefModifier;
          uint16_t bitRevFactor;
  } arm_cfft_radix2_instance_q31;


  arm_status arm_cfft_radix2_init_q31(
        arm_cfft_radix2_instance_q31 * S,
        uint16_t fftLen,
        uint8_t ifftFlag,
        uint8_t bitReverseFlag);


  void arm_cfft_radix2_q31(
  const arm_cfft_radix2_instance_q31 * S,
        q31_t * pSrc);




  typedef struct
  {
          uint16_t fftLen;
          uint8_t ifftFlag;
          uint8_t bitReverseFlag;
    const q31_t *pTwiddle;
    const uint16_t *pBitRevTable;
          uint16_t twidCoefModifier;
          uint16_t bitRevFactor;
  } arm_cfft_radix4_instance_q31;


  void arm_cfft_radix4_q31(
  const arm_cfft_radix4_instance_q31 * S,
        q31_t * pSrc);


  arm_status arm_cfft_radix4_init_q31(
        arm_cfft_radix4_instance_q31 * S,
        uint16_t fftLen,
        uint8_t ifftFlag,
        uint8_t bitReverseFlag);




  typedef struct
  {
          uint16_t fftLen;
          uint8_t ifftFlag;
          uint8_t bitReverseFlag;
    const float32_t *pTwiddle;
    const uint16_t *pBitRevTable;
          uint16_t twidCoefModifier;
          uint16_t bitRevFactor;
          float32_t onebyfftLen;
  } arm_cfft_radix2_instance_f32;



  arm_status arm_cfft_radix2_init_f32(
        arm_cfft_radix2_instance_f32 * S,
        uint16_t fftLen,
        uint8_t ifftFlag,
        uint8_t bitReverseFlag);


  void arm_cfft_radix2_f32(
  const arm_cfft_radix2_instance_f32 * S,
        float32_t * pSrc);




  typedef struct
  {
          uint16_t fftLen;
          uint8_t ifftFlag;
          uint8_t bitReverseFlag;
    const float32_t *pTwiddle;
    const uint16_t *pBitRevTable;
          uint16_t twidCoefModifier;
          uint16_t bitRevFactor;
          float32_t onebyfftLen;
  } arm_cfft_radix4_instance_f32;




  arm_status arm_cfft_radix4_init_f32(
        arm_cfft_radix4_instance_f32 * S,
        uint16_t fftLen,
        uint8_t ifftFlag,
        uint8_t bitReverseFlag);


  void arm_cfft_radix4_f32(
  const arm_cfft_radix4_instance_f32 * S,
        float32_t * pSrc);




  typedef struct
  {
          uint16_t fftLen;
    const q15_t *pTwiddle;
    const uint16_t *pBitRevTable;
          uint16_t bitRevLength;
# 229 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  } arm_cfft_instance_q15;

arm_status arm_cfft_init_q15(
  arm_cfft_instance_q15 * S,
  uint16_t fftLen);

void arm_cfft_q15(
    const arm_cfft_instance_q15 * S,
          q15_t * p1,
          uint8_t ifftFlag,
          uint8_t bitReverseFlag);




  typedef struct
  {
          uint16_t fftLen;
    const q31_t *pTwiddle;
    const uint16_t *pBitRevTable;
          uint16_t bitRevLength;
# 258 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  } arm_cfft_instance_q31;

arm_status arm_cfft_init_q31(
  arm_cfft_instance_q31 * S,
  uint16_t fftLen);

void arm_cfft_q31(
    const arm_cfft_instance_q31 * S,
          q31_t * p1,
          uint8_t ifftFlag,
          uint8_t bitReverseFlag);




  typedef struct
  {
          uint16_t fftLen;
    const float32_t *pTwiddle;
    const uint16_t *pBitRevTable;
          uint16_t bitRevLength;
# 287 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  } arm_cfft_instance_f32;



  arm_status arm_cfft_init_f32(
  arm_cfft_instance_f32 * S,
  uint16_t fftLen);

  void arm_cfft_f32(
  const arm_cfft_instance_f32 * S,
        float32_t * p1,
        uint8_t ifftFlag,
        uint8_t bitReverseFlag);





  typedef struct
  {
          uint16_t fftLen;
    const float64_t *pTwiddle;
    const uint16_t *pBitRevTable;
          uint16_t bitRevLength;
  } arm_cfft_instance_f64;

  arm_status arm_cfft_init_f64(
  arm_cfft_instance_f64 * S,
  uint16_t fftLen);

  void arm_cfft_f64(
  const arm_cfft_instance_f64 * S,
        float64_t * p1,
        uint8_t ifftFlag,
        uint8_t bitReverseFlag);




  typedef struct
  {
          uint32_t fftLenReal;
          uint8_t ifftFlagR;
          uint8_t bitReverseFlagR;
          uint32_t twidCoefRModifier;
    const q15_t *pTwiddleAReal;
    const q15_t *pTwiddleBReal;



    const arm_cfft_instance_q15 *pCfft;

  } arm_rfft_instance_q15;

  arm_status arm_rfft_init_q15(
        arm_rfft_instance_q15 * S,
        uint32_t fftLenReal,
        uint32_t ifftFlagR,
        uint32_t bitReverseFlag);

  void arm_rfft_q15(
  const arm_rfft_instance_q15 * S,
        q15_t * pSrc,
        q15_t * pDst);




  typedef struct
  {
          uint32_t fftLenReal;
          uint8_t ifftFlagR;
          uint8_t bitReverseFlagR;
          uint32_t twidCoefRModifier;
    const q31_t *pTwiddleAReal;
    const q31_t *pTwiddleBReal;



    const arm_cfft_instance_q31 *pCfft;

  } arm_rfft_instance_q31;

  arm_status arm_rfft_init_q31(
        arm_rfft_instance_q31 * S,
        uint32_t fftLenReal,
        uint32_t ifftFlagR,
        uint32_t bitReverseFlag);

  void arm_rfft_q31(
  const arm_rfft_instance_q31 * S,
        q31_t * pSrc,
        q31_t * pDst);




  typedef struct
  {
          uint32_t fftLenReal;
          uint16_t fftLenBy2;
          uint8_t ifftFlagR;
          uint8_t bitReverseFlagR;
          uint32_t twidCoefRModifier;
    const float32_t *pTwiddleAReal;
    const float32_t *pTwiddleBReal;
          arm_cfft_radix4_instance_f32 *pCfft;
  } arm_rfft_instance_f32;

  arm_status arm_rfft_init_f32(
        arm_rfft_instance_f32 * S,
        arm_cfft_radix4_instance_f32 * S_CFFT,
        uint32_t fftLenReal,
        uint32_t ifftFlagR,
        uint32_t bitReverseFlag);

  void arm_rfft_f32(
  const arm_rfft_instance_f32 * S,
        float32_t * pSrc,
        float32_t * pDst);




typedef struct
  {
          arm_cfft_instance_f64 Sint;
          uint16_t fftLenRFFT;
    const float64_t * pTwiddleRFFT;
  } arm_rfft_fast_instance_f64 ;

arm_status arm_rfft_fast_init_f64 (
         arm_rfft_fast_instance_f64 * S,
         uint16_t fftLen);


void arm_rfft_fast_f64(
    arm_rfft_fast_instance_f64 * S,
    float64_t * p, float64_t * pOut,
    uint8_t ifftFlag);





typedef struct
  {
          arm_cfft_instance_f32 Sint;
          uint16_t fftLenRFFT;
    const float32_t * pTwiddleRFFT;
  } arm_rfft_fast_instance_f32 ;

arm_status arm_rfft_fast_init_f32 (
         arm_rfft_fast_instance_f32 * S,
         uint16_t fftLen);


  void arm_rfft_fast_f32(
        const arm_rfft_fast_instance_f32 * S,
        float32_t * p, float32_t * pOut,
        uint8_t ifftFlag);




  typedef struct
  {
          uint16_t N;
          uint16_t Nby2;
          float32_t normalize;
    const float32_t *pTwiddle;
    const float32_t *pCosFactor;
          arm_rfft_instance_f32 *pRfft;
          arm_cfft_radix4_instance_f32 *pCfft;
  } arm_dct4_instance_f32;
# 474 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  arm_status arm_dct4_init_f32(
        arm_dct4_instance_f32 * S,
        arm_rfft_instance_f32 * S_RFFT,
        arm_cfft_radix4_instance_f32 * S_CFFT,
        uint16_t N,
        uint16_t Nby2,
        float32_t normalize);
# 489 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  void arm_dct4_f32(
  const arm_dct4_instance_f32 * S,
        float32_t * pState,
        float32_t * pInlineBuffer);





  typedef struct
  {
          uint16_t N;
          uint16_t Nby2;
          q31_t normalize;
    const q31_t *pTwiddle;
    const q31_t *pCosFactor;
          arm_rfft_instance_q31 *pRfft;
          arm_cfft_radix4_instance_q31 *pCfft;
  } arm_dct4_instance_q31;
# 520 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  arm_status arm_dct4_init_q31(
        arm_dct4_instance_q31 * S,
        arm_rfft_instance_q31 * S_RFFT,
        arm_cfft_radix4_instance_q31 * S_CFFT,
        uint16_t N,
        uint16_t Nby2,
        q31_t normalize);
# 535 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  void arm_dct4_q31(
  const arm_dct4_instance_q31 * S,
        q31_t * pState,
        q31_t * pInlineBuffer);





  typedef struct
  {
          uint16_t N;
          uint16_t Nby2;
          q15_t normalize;
    const q15_t *pTwiddle;
    const q15_t *pCosFactor;
          arm_rfft_instance_q15 *pRfft;
          arm_cfft_radix4_instance_q15 *pCfft;
  } arm_dct4_instance_q15;
# 566 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  arm_status arm_dct4_init_q15(
        arm_dct4_instance_q15 * S,
        arm_rfft_instance_q15 * S_RFFT,
        arm_cfft_radix4_instance_q15 * S_CFFT,
        uint16_t N,
        uint16_t Nby2,
        q15_t normalize);
# 581 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  void arm_dct4_q15(
  const arm_dct4_instance_q15 * S,
        q15_t * pState,
        q15_t * pInlineBuffer);




typedef struct
  {
     const float32_t *dctCoefs;
     const float32_t *filterCoefs;
     const float32_t *windowCoefs;
     const uint32_t *filterPos;
     const uint32_t *filterLengths;
     uint32_t fftLen;
     uint32_t nbMelFilters;
     uint32_t nbDctOutputs;





     arm_rfft_fast_instance_f32 rfft;

  } arm_mfcc_instance_f32 ;

arm_status arm_mfcc_init_f32(
  arm_mfcc_instance_f32 * S,
  uint32_t fftLen,
  uint32_t nbMelFilters,
  uint32_t nbDctOutputs,
  const float32_t *dctCoefs,
  const uint32_t *filterPos,
  const uint32_t *filterLengths,
  const float32_t *filterCoefs,
  const float32_t *windowCoefs
  );
# 629 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  void arm_mfcc_f32(
  const arm_mfcc_instance_f32 * S,
  float32_t *pSrc,
  float32_t *pDst,
  float32_t *pTmp
  );

typedef struct
  {
     const q31_t *dctCoefs;
     const q31_t *filterCoefs;
     const q31_t *windowCoefs;
     const uint32_t *filterPos;
     const uint32_t *filterLengths;
     uint32_t fftLen;
     uint32_t nbMelFilters;
     uint32_t nbDctOutputs;





     arm_rfft_instance_q31 rfft;

  } arm_mfcc_instance_q31 ;

arm_status arm_mfcc_init_q31(
  arm_mfcc_instance_q31 * S,
  uint32_t fftLen,
  uint32_t nbMelFilters,
  uint32_t nbDctOutputs,
  const q31_t *dctCoefs,
  const uint32_t *filterPos,
  const uint32_t *filterLengths,
  const q31_t *filterCoefs,
  const q31_t *windowCoefs
  );
# 676 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  arm_status arm_mfcc_q31(
  const arm_mfcc_instance_q31 * S,
  q31_t *pSrc,
  q31_t *pDst,
  q31_t *pTmp
  );

typedef struct
  {
     const q15_t *dctCoefs;
     const q15_t *filterCoefs;
     const q15_t *windowCoefs;
     const uint32_t *filterPos;
     const uint32_t *filterLengths;
     uint32_t fftLen;
     uint32_t nbMelFilters;
     uint32_t nbDctOutputs;





     arm_rfft_instance_q15 rfft;

  } arm_mfcc_instance_q15 ;

arm_status arm_mfcc_init_q15(
  arm_mfcc_instance_q15 * S,
  uint32_t fftLen,
  uint32_t nbMelFilters,
  uint32_t nbDctOutputs,
  const q15_t *dctCoefs,
  const uint32_t *filterPos,
  const uint32_t *filterLengths,
  const q15_t *filterCoefs,
  const q15_t *windowCoefs
  );
# 723 "C:/Users/peppe/OneDrive/Desktop/fft_test/lib/arm_math/dsp/transform_functions.h"
  arm_status arm_mfcc_q15(
  const arm_mfcc_instance_q15 * S,
  q15_t *pSrc,
  q15_t *pDst,
  q31_t *pTmp
  );
# 30 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\lib\\arm_math\\dsp\\TransformFunctions\\arm_cfft_radix2_q31.c" 2

void arm_radix2_butterfly_q31(
        q31_t * pSrc,
        uint32_t fftLen,
  const q31_t * pCoef,
        uint16_t twidCoefModifier);

void arm_radix2_butterfly_inverse_q31(
        q31_t * pSrc,
        uint32_t fftLen,
  const q31_t * pCoef,
        uint16_t twidCoefModifier);

void arm_bitreversal_q31(
        q31_t * pSrc,
        uint32_t fftLen,
        uint16_t bitRevFactor,
  const uint16_t * pBitRevTab);
# 66 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\lib\\arm_math\\dsp\\TransformFunctions\\arm_cfft_radix2_q31.c"
void arm_cfft_radix2_q31(
  const arm_cfft_radix2_instance_q31 * S,
        q31_t * pSrc)
{

   if (S->ifftFlag == 1U)
   {
      arm_radix2_butterfly_inverse_q31(pSrc, S->fftLen,
      S->pTwiddle, S->twidCoefModifier);
   }
   else
   {
      arm_radix2_butterfly_q31(pSrc, S->fftLen,
      S->pTwiddle, S->twidCoefModifier);
   }

   arm_bitreversal_q31(pSrc, S->fftLen, S->bitRevFactor, S->pBitRevTable);
}





void arm_radix2_butterfly_q31(
        q31_t * pSrc,
        uint32_t fftLen,
  const q31_t * pCoef,
        uint16_t twidCoefModifier)
{

   unsigned i, j, k, l, m;
   unsigned n1, n2, ia;
   q31_t xt, yt, cosVal, sinVal;
   q31_t p0, p1;


   n2 = fftLen;

   n1 = n2;
   n2 = n2 >> 1;
   ia = 0;


   for (i = 0; i < n2; i++)
   {
      cosVal = pCoef[ia * 2];
      sinVal = pCoef[(ia * 2) + 1];
      ia = ia + twidCoefModifier;

      l = i + n2;
      xt = (pSrc[2 * i] >> 1U) - (pSrc[2 * l] >> 1U);
      pSrc[2 * i] = ((pSrc[2 * i] >> 1U) + (pSrc[2 * l] >> 1U)) >> 1U;

      yt = (pSrc[2 * i + 1] >> 1U) - (pSrc[2 * l + 1] >> 1U);
      pSrc[2 * i + 1] =
        ((pSrc[2 * l + 1] >> 1U) + (pSrc[2 * i + 1] >> 1U)) >> 1U;

      p0 = (q31_t) (((q63_t) xt * cosVal + 0x80000000LL ) >> 32);
      p1 = (q31_t) (((q63_t) yt * cosVal + 0x80000000LL ) >> 32);
      p0 = (q31_t) (((((q63_t) p0) << 32) + ((q63_t) yt * sinVal) + 0x80000000LL ) >> 32);
      p1 = (q31_t) (((((q63_t) p1) << 32) - ((q63_t) xt * sinVal) + 0x80000000LL ) >> 32);

      pSrc[2U * l] = p0;
      pSrc[2U * l + 1U] = p1;

   }

   twidCoefModifier <<= 1U;


   for (k = fftLen / 2; k > 2; k = k >> 1)
   {
      n1 = n2;
      n2 = n2 >> 1;
      ia = 0;


      for (j = 0; j < n2; j++)
      {
         cosVal = pCoef[ia * 2];
         sinVal = pCoef[(ia * 2) + 1];
         ia = ia + twidCoefModifier;


         i = j;
         m = fftLen / n1;
         do
         {
            l = i + n2;
            xt = pSrc[2 * i] - pSrc[2 * l];
            pSrc[2 * i] = (pSrc[2 * i] + pSrc[2 * l]) >> 1U;

            yt = pSrc[2 * i + 1] - pSrc[2 * l + 1];
            pSrc[2 * i + 1] = (pSrc[2 * l + 1] + pSrc[2 * i + 1]) >> 1U;

            p0 = (q31_t) (((q63_t) xt * cosVal + 0x80000000LL ) >> 32);
            p1 = (q31_t) (((q63_t) yt * cosVal + 0x80000000LL ) >> 32);
            p0 = (q31_t) (((((q63_t) p0) << 32) + ((q63_t) yt * sinVal) + 0x80000000LL ) >> 32);
            p1 = (q31_t) (((((q63_t) p1) << 32) - ((q63_t) xt * sinVal) + 0x80000000LL ) >> 32);

            pSrc[2U * l] = p0;
            pSrc[2U * l + 1U] = p1;
            i += n1;
            m--;
         } while ( m > 0);

      }

      twidCoefModifier <<= 1U;
   }

   n1 = n2;
   n2 = n2 >> 1;
   ia = 0;

   cosVal = pCoef[ia * 2];
   sinVal = pCoef[(ia * 2) + 1];
   ia = ia + twidCoefModifier;


   for (i = 0; i < fftLen; i += n1)
   {
      l = i + n2;
      xt = pSrc[2 * i] - pSrc[2 * l];
      pSrc[2 * i] = (pSrc[2 * i] + pSrc[2 * l]);

      yt = pSrc[2 * i + 1] - pSrc[2 * l + 1];
      pSrc[2 * i + 1] = (pSrc[2 * l + 1] + pSrc[2 * i + 1]);

      pSrc[2U * l] = xt;

      pSrc[2U * l + 1U] = yt;

      i += n1;
      l = i + n2;

      xt = pSrc[2 * i] - pSrc[2 * l];
      pSrc[2 * i] = (pSrc[2 * i] + pSrc[2 * l]);

      yt = pSrc[2 * i + 1] - pSrc[2 * l + 1];
      pSrc[2 * i + 1] = (pSrc[2 * l + 1] + pSrc[2 * i + 1]);

      pSrc[2U * l] = xt;

      pSrc[2U * l + 1U] = yt;

   }

}


void arm_radix2_butterfly_inverse_q31(
        q31_t * pSrc,
        uint32_t fftLen,
  const q31_t * pCoef,
        uint16_t twidCoefModifier)
{

   unsigned i, j, k, l;
   unsigned n1, n2, ia;
   q31_t xt, yt, cosVal, sinVal;
   q31_t p0, p1;


   n2 = fftLen;

   n1 = n2;
   n2 = n2 >> 1;
   ia = 0;


   for (i = 0; i < n2; i++)
   {
      cosVal = pCoef[ia * 2];
      sinVal = pCoef[(ia * 2) + 1];
      ia = ia + twidCoefModifier;

      l = i + n2;
      xt = (pSrc[2 * i] >> 1U) - (pSrc[2 * l] >> 1U);
      pSrc[2 * i] = ((pSrc[2 * i] >> 1U) + (pSrc[2 * l] >> 1U)) >> 1U;

      yt = (pSrc[2 * i + 1] >> 1U) - (pSrc[2 * l + 1] >> 1U);
      pSrc[2 * i + 1] =
        ((pSrc[2 * l + 1] >> 1U) + (pSrc[2 * i + 1] >> 1U)) >> 1U;

      p0 = (q31_t) (((q63_t) xt * cosVal + 0x80000000LL ) >> 32);
      p1 = (q31_t) (((q63_t) yt * cosVal + 0x80000000LL ) >> 32);
      p0 = (q31_t) (((((q63_t) p0) << 32) - ((q63_t) yt * sinVal) + 0x80000000LL ) >> 32);
      p1 = (q31_t) (((((q63_t) p1) << 32) + ((q63_t) xt * sinVal) + 0x80000000LL ) >> 32);

      pSrc[2U * l] = p0;
      pSrc[2U * l + 1U] = p1;
   }

   twidCoefModifier = twidCoefModifier << 1U;


   for (k = fftLen / 2; k > 2; k = k >> 1)
   {
      n1 = n2;
      n2 = n2 >> 1;
      ia = 0;


      for (j = 0; j < n2; j++)
      {
         cosVal = pCoef[ia * 2];
         sinVal = pCoef[(ia * 2) + 1];
         ia = ia + twidCoefModifier;


         for (i = j; i < fftLen; i += n1)
         {
            l = i + n2;
            xt = pSrc[2 * i] - pSrc[2 * l];
            pSrc[2 * i] = (pSrc[2 * i] + pSrc[2 * l]) >> 1U;

            yt = pSrc[2 * i + 1] - pSrc[2 * l + 1];
            pSrc[2 * i + 1] = (pSrc[2 * l + 1] + pSrc[2 * i + 1]) >> 1U;

            p0 = (q31_t) (((q63_t) xt * cosVal + 0x80000000LL ) >> 32);
            p1 = (q31_t) (((q63_t) yt * cosVal + 0x80000000LL ) >> 32);
            p0 = (q31_t) (((((q63_t) p0) << 32) - ((q63_t) yt * sinVal) + 0x80000000LL ) >> 32);
            p1 = (q31_t) (((((q63_t) p1) << 32) + ((q63_t) xt * sinVal) + 0x80000000LL ) >> 32);

            pSrc[2U * l] = p0;
            pSrc[2U * l + 1U] = p1;
         }

      }

      twidCoefModifier = twidCoefModifier << 1U;
   }

   n1 = n2;
   n2 = n2 >> 1;
   ia = 0;

   cosVal = pCoef[ia * 2];
   sinVal = pCoef[(ia * 2) + 1];
   ia = ia + twidCoefModifier;


   for (i = 0; i < fftLen; i += n1)
   {
      l = i + n2;
      xt = pSrc[2 * i] - pSrc[2 * l];
      pSrc[2 * i] = (pSrc[2 * i] + pSrc[2 * l]);

      yt = pSrc[2 * i + 1] - pSrc[2 * l + 1];
      pSrc[2 * i + 1] = (pSrc[2 * l + 1] + pSrc[2 * i + 1]);

      pSrc[2U * l] = xt;

      pSrc[2U * l + 1U] = yt;

      i += n1;
      l = i + n2;

      xt = pSrc[2 * i] - pSrc[2 * l];
      pSrc[2 * i] = (pSrc[2 * i] + pSrc[2 * l]);

      yt = pSrc[2 * i + 1] - pSrc[2 * l + 1];
      pSrc[2 * i + 1] = (pSrc[2 * l + 1] + pSrc[2 * i + 1]);

      pSrc[2U * l] = xt;

      pSrc[2U * l + 1U] = yt;

   }

}
