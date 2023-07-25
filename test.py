import pytest
from core_nlp import get_phrases

def test_get_phrases():
    # Test senaryosu için giriş verileri
    name = "Golden State Warriors"

    # get_phrases fonksiyonunu çağır
    phrases = get_phrases(name)

    # Beklenen sonuç: "name" değişkenin kelimesinin sayısı 108
    expected_count = 108

    # Testi kontrol et
    assert len(phrases) == expected_count, f"Test failed. Expected: {expected_count}, Actual: {len(phrases)}"
