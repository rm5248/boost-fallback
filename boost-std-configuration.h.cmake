#ifndef BOOST_STD_CONFIGURATION_H
#define BOOST_STD_CONFIGURATION_H

#cmakedefine01 STD_THREAD_FOUND
#cmakedefine01 Boost_THREAD_FOUND
#cmakedefine01 STD_MUTEX_FOUND
#cmakedefine01 Boost_MUTEX_FOUND
#cmakedefine01 STD_SHARED_MUTEX_FOUND
#cmakedefine01 Boost_SHARED_MUTEX_FOUND
#cmakedefine01 STD_SHARED_PTR_FOUND
#cmakedefine01 Boost_SHARED_PTR_FOUND

#if STD_THREAD_FOUND
#include <thread>
namespace ${NAMESPACE_ALIAS} {
    typedef std::thread thread;
}
#elif Boost_THREAD_FOUND
#include <boost/thread.hpp>
namespace ${NAMESPACE_ALIAS} {
    typedef boost::thread thread;
}
#endif

#if STD_MUTEX_FOUND
#include <mutex>
namespace ${NAMESPACE_ALIAS} {
    typedef std::mutex mutex;
    typedef std::unique_lock unique_lock;
}
#elif Boost_MUTEX_FOUND
#include <boost/thread.hpp>
namespace ${NAMESPACE_ALIAS} {
    typedef boost::mutex mutex;
    typedef boost::unique_lock unique_lock;
}
#endif

#if STD_SHARED_MUTEX_FOUND
#include <shared_mutex>
namespace ${NAMESPACE_ALIAS} {
    typedef std::shared_mutex shared_mutex;
    typedef std::shared_lock shared_lock;
}
#elif Boost_SHARED_MUTEX_FOUND
#include <boost/thread/shared_mutex.hpp>
namespace ${NAMESPACE_ALIAS} {
    typedef boost::shared_mutex shared_mutex;
    typedef boost::shared_lock shared_lock;
}
#endif

#if STD_SHARED_PTR_FOUND
#include <memory>
namespace ${NAMESPACE_ALIAS} {
    template <typename T>
    using shared_ptr = std::shared_ptr<T>;
    template <typename T>
    using weak_ptr = std::weak_ptr<T>;
}
#elif Boost_SHARED_PTR_FOUND
#include <boost/smart_ptr.hpp>
namespace ${NAMESPACE_ALIAS} {
    template <typename T>
    using shared_ptr = boost::shared_ptr<T>;
    template <typename T>
    using weak_ptr = boost::weak_ptr<T>;
}
#endif

#endif /* BOOST_STD_CONFIGURATION_H */
